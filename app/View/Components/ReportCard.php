<?php

namespace App\View\Components;

use Illuminate\View\Component;

class ReportCard extends Component
{
	public $report;
	public $bgClass;

	public function __construct($report, $bgClass = 'bg-white')
	{
		$this->report = $report;
		$this->bgClass = $bgClass;
	}

	public function render()
	{
		return view('components.report-card');
	}
}
