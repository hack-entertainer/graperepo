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

    /**
     * Entry point used by scenario seeders.
     */
    public function materialize(array $scenario): void
    {
        $this->scenario = $scenario;

        $this->resolveUsers();
        $this->createReportAsReporter();
        $this->addSubjectResponse();
        $this->addCommunityComments();
    }

    /**
     * Ensure all referenced users exist.
     * Missing users are a configuration error.
     */
    protected function resolveUsers(): void
    {
        $emails = collect([
            Arr::get($this->scenario, 'reporter.email'),
            Arr::get($this->scenario, 'subject.email'),
        ])->filter()->unique();

        $users = User::whereIn('email', $emails)->get()->keyBy('email');

        foreach ($emails as $email) {
            if (! $users->has($email)) {
                throw new \RuntimeException("Scenario user not found: {$email}");
            }
        }

        $this->users = $users;
    }

    /**
     * Create the report as the reporter.
     * Idempotent via origin_key.
     */
    protected function createReportAsReporter(): void
    {
        $key = Arr::get($this->scenario, 'key');
        if (! $key) {
            throw new \RuntimeException('Scenario key is required');
        }

        $originKey = "demo:{$key}";

        // Idempotency guard
        $existing = Reports::where('origin_key', $originKey)->first();
        if ($existing) {
            $this->report = $existing;
            return;
        }

        $reporter = $this->user(
            Arr::get($this->scenario, 'reporter.email')
        );

        $report = new Reports();
        $report->report_number = Reports::generateReportNumber();

        // Origin metadata
        $report->origin_type = 'demo';
        $report->origin_key  = $originKey;

        // Reporter identity
        $report->reporter_id    = $reporter->id;
        $report->reporter_name  = Arr::get($this->scenario, 'reporter.name');
        $report->reporter_email = Arr::get($this->scenario, 'reporter.email');

        // Incident details
        $report->type_event  = Arr::get($this->scenario, 'incident.type');
        $report->description = Arr::get($this->scenario, 'incident.description');

        // Event date (required, no default in schema)
        $report->event_date = Arr::get(
            $this->scenario,
            'incident.event_date',
            now()->toDateString()
        );

        // Optional evidence
        $report->video_link = Arr::get($this->scenario, 'incident.evidence.0');

        // Subject identity
        $report->subject_fullname = Arr::get($this->scenario, 'subject.name');
        $report->subject_email    = Arr::get($this->scenario, 'subject.email');
        $report->subject_phone    = Arr::get($this->scenario, 'subject.phone');

        // Subject address
        $report->subject_address = Arr::get($this->scenario, 'subject.address.street');
        $report->subject_city    = Arr::get($this->scenario, 'subject.address.city');
        $report->subject_state   = Arr::get($this->scenario, 'subject.address.state');
        $report->subject_zipcode = Arr::get($this->scenario, 'subject.address.zip');
        $report->subject_country = Arr::get($this->scenario, 'subject.address.country');

        $report->save();

        $this->report = $report;
    }

    /**
     * Add the subject's response.
     * One response per report.
     */
    protected function addSubjectResponse(): void
    {
        $content = Arr::get($this->scenario, 'subject_response');

        if (! $content) {
            return;
        }

        $report  = $this->report();
        $subject = $this->user(
            Arr::get($this->scenario, 'subject.email')
        );

        ReportResponse::firstOrCreate(
            [
                'report_id' => $report->id,
                'user_id'   => $subject->id,
                'type' => 'subject_responses',
            ],
            [
                'user_fullname' => Arr::get($this->scenario, 'subject.name'),
                'content'       => $content,
            ]
        );
    }


    /**
     * Add community comments using a deterministic commenter pool.
     */
    protected function addCommunityComments(): void
    {
        $comments = Arr::get($this->scenario, 'community_comments', []);
        if (empty($comments)) {
            return;
        }

        $report = $this->report();

        $commenters = User::where('email', 'like', 'commenter%@demo.local')
            ->orderBy('email')
            ->get();

        if ($commenters->isEmpty()) {
            throw new \RuntimeException('No community commenters available');
        }

        foreach ($comments as $index => $content) {
            $author = $commenters[$index % $commenters->count()];

            ReportComments::firstOrCreate(
                [
                    'report_id' => $report->id,
                    'user_id'   => $author->id,
                    'content'   => $content,
                ],
                [
                    'user_fullname' => $author->name,
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
