@extends('user.layouts.master')

@section('main-content')
<div class="container-fluid">
    @include('user.layouts.notification')
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
      <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
    </div>

    <!-- Content Row -->
    {{-- <div class="row">

      <!-- Category -->
      <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
          <div class="card-body">
            <div class="row no-gutters align-items-center">
              <div class="col mr-2">
                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Category</div>
                <div class="h5 mb-0 font-weight-bold text-gray-800">{{\App\Models\Category::countActiveCategory()}}</div>
              </div>
              <div class="col-auto">
                <i class="fas fa-sitemap fa-2x text-gray-300"></i>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Products -->
      <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
          <div class="card-body">
            <div class="row no-gutters align-items-center">
              <div class="col mr-2">
                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Products</div>
                <div class="h5 mb-0 font-weight-bold text-gray-800">{{\App\Models\Product::countActiveProduct()}}</div>
              </div>
              <div class="col-auto">
                <i class="fas fa-cubes fa-2x text-gray-300"></i>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Order -->
      <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-info shadow h-100 py-2">
          <div class="card-body">
            <div class="row no-gutters align-items-center">
              <div class="col mr-2">
                <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Order</div>
                <div class="row no-gutters align-items-center">
                  <div class="col-auto">
                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">{{\App\Models\Order::countActiveOrder()}}</div>
                  </div>
                  
                </div>
              </div>
              <div class="col-auto">
                <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!--Posts-->
      <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-warning shadow h-100 py-2">
          <div class="card-body">
            <div class="row no-gutters align-items-center">
              <div class="col mr-2">
                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Post</div>
                <div class="h5 mb-0 font-weight-bold text-gray-800">{{\App\Models\Post::countActivePost()}}</div>
              </div>
              <div class="col-auto">
                <i class="fas fa-folder fa-2x text-gray-300"></i>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div> --}}

    <!-- Content Row -->

    <div class="row">
     
      <!-- Order -->
      <div class="col-xl-12 col-lg-12">
        <table class="table table-bordered" id="order-dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
                <th>S.N.</th>
                <th>Subject (Accused Person)</th>
                <th>Subject Location</th>
                <th>Type of Incident</th>
                <th>Date of Incident</th>
                <th>Payment status</th>
                <th>Status</th>
                <th>Created at</th>
                <th>Action</th>
              </tr>
          </thead>
          
          <tbody>
            @if(count($reports)>0)
              @foreach($reports as $report)   
                  <tr>
                      <td>{{$report->report_number}}</td>
                      <td>{{$report->subject_fullname}}</td>
                      <td>{{$report->subject_location}}</td>
                      <td>{{$report->type_event}}</td>
                      <td>{{$report->event_date}}</td>
                      
                      <td>
                          @if($report->payment_status=='paid')
                              <span class="badge badge-success">{{$report->payment_status}}</span>
                          @else
                              <span class="badge badge-warning">{{$report->payment_status}}</span>
                          @endif
                      </td>
                      <td>{{$report->status}}</td>
                      <td>{{(($report->created_at))}}</td>
                      
                      <td>
                          <a href="{{route('report-detail',$report->report_number)}}" target="_blank" class="btn btn-primary btn-sm float-left mr-1" style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" title="edit" data-placement="bottom">
                            <i class="fas fa-eye"></i>
                          </a>
                      </td>
                     
                  </tr>  
              @endforeach
              @else
                <td colspan="8" class="text-center"><h4 class="my-4">No reports made. Please visit the homepage to post a report.</h4></td>
              @endif
          </tbody>
        </table>

        {{$reports->links()}}
      </div>
    </div>

  </div>
@endsection
