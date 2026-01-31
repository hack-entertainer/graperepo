<?php

namespace App\Support\Scenarios;

use App\User;
use App\Models\Reports;
use App\Models\ReportResponse;
use App\Models\ReportComments;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;

class ReportScenarioBuilder
{
    protected array $scenario;
    protected Collection $users;
    protected ?Reports $report = null;

    public function __construct()
    {
        $this->users = collect();
    }

    public function materialize(array $scenario): void
    {
        $this->scenario = $scenario;

        $this->resolveUsers();
        $this->createReportAsReporter();
        $this->addSubjectResponse();
        $this->addCommunityComments();
    }

    protected function resolveUsers(): void
    {
        $emails = collect([
            Arr::get($this->scenario, 'reporter.email'),
            Arr::get($this->scenario, 'subject.email'),
        ])->filter()->unique();

        $users = User::whereIn('email', $emails)->get()->keyBy('email');

        foreach ($emails as $email) {
            if (! $users->has($email)) {
                throw new \RuntimeException(
                    "Scenario user not found: {$email}"
                );
            }
        }

        $this->users = $users;
    }

    protected function createReportAsReporter(): void
    {
        $key = Arr::get($this->scenario, 'key');

        if (! $key) {
            throw new \RuntimeException('Scenario key is required');
        }

        $existing = Reports::where('scenario_key', $key)->first();
        if ($existing) {
            $this->report = $existing;
            return;
        }

        $reporter = $this->user(
            Arr::get($this->scenario, 'reporter.email')
        );

        $report = new Reports();
        $report->scenario_key = $key;
        $report->reporter_id  = $reporter->id;

        $report->incident_type = Arr::get($this->scenario, 'incident.type');
        $report->description   = Arr::get($this->scenario, 'incident.description');

        $report->subject_name  = Arr::get($this->scenario, 'subject.name');
        $report->subject_email = Arr::get($this->scenario, 'subject.email');
        $report->subject_phone = Arr::get($this->scenario, 'subject.phone');

        $report->save();

        $this->report = $report;
    }

    protected function addSubjectResponse(): void
    {
        $body = Arr::get($this->scenario, 'subject_response');

        if (! $body) {
            return;
        }

        $report  = $this->report();
        $subject = $this->user(
            Arr::get($this->scenario, 'subject.email')
        );

        ReportResponse::firstOrCreate(
            [
                'report_id' => $report->id,
            ],
            [
                'user_id' => $subject->id,
                'body'    => $body,
            ]
        );
    }

    /**
     * Add community comments using a rotating commenter pool.
     *
     * Idempotent: (report_id + position) is the uniqueness boundary.
     */
    protected function addCommunityComments(): void
    {
        $comments = Arr::get($this->scenario, 'community_comments', []);

        if (empty($comments)) {
            return;
        }

        $report = $this->report();

        // Pull deterministic commenter pool
        $commenters = User::where('email', 'like', 'commenter%@demo.local')
            ->orderBy('email')
            ->get();

        if ($commenters->isEmpty()) {
            throw new \RuntimeException('No community commenters available');
        }

        foreach ($comments as $index => $body) {
            $author = $commenters[$index % $commenters->count()];

            ReportComments::firstOrCreate(
                [
                    'report_id' => $report->id,
                    'position'  => $index,
                ],
                [
                    'user_id' => $author->id,
                    'body'    => $body,
                ]
            );
        }
    }

    protected function user(string $email): User
    {
        return $this->users->get($email);
    }

    protected function report(): Reports
    {
        if (! $this->report) {
            throw new \RuntimeException('Report not initialized');
        }

        return $this->report;
    }
}
