@extends('backend.doctor.layout')
@section('content-doctor')
<!-- bang bieu do -->
<div class="panel panel-primary" >
	<div class="panel panel-heading boxheader"> 
	Biểu diễn độ cận thị của học sinh HELLO</div>
	<div class="panel panel-body">
		<div class="seach-school">
			<form class="form-horizontal"  method="POST"  >
				<div class="form-group col-md-6">
					<label class="control-label col-md-4">Chọn trường:</label>
					<div class="col-md-8"> 
						<select class="form-control col-md-12" id="selector">
							@foreach($schools as $school)
							<option value="{!! $school->school_id !!}"> {!! $school->school_name !!} </option>
							@endforeach
						</select>
					</div>
				</div>
				<div class="form-group col-md-6">
					<label class="control-label col-md-4">Mã học sinh:</label>
					<div class="col-md-6">   
						<input type="text" id="student_code" name="student_code" value="" class="form-control">
					</div>
					<input  type="button" onclick="getStudentChart()" class="btn btn-primary col-md-2" value="Xem" name="">
				</div>
			</form>
			</div>
		</div>
		<div id="chart-container">
			<canvas id="line-chart"></canvas>
		</div>
	</div>

@endsection
