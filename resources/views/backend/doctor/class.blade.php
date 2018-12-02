@extends('backend.doctor.layout')
@section('content-doctor')
<!-- bang bieu do -->
<div class="panel panel-primary" >
	<div class="panel panel-heading boxheader">
	Biểu diễn độ cận thị của học sinh của một lớp học</div>
	<div class="panel panel-body">
		<div class="seach-school">
			<form class="form-horizontal"  method="POST"  >
				<div class="form-group col-md-6">
					<label class="control-label col-md-4">Chọn trường:</label>
					<div class="col-md-8">
						<select class="form-control col-md-12"  id="selector">
							@foreach($schools as $school)
							<option value="{!! $school->school_id !!}"> {!! $school->school_name !!} </option>
							@endforeach
						</select>
					</div>
				</div>
				<div class="form-group col-md-6">
					<label class="control-label col-md-4">Chọn Khóa:</label>
					<div class="col-md-8">
						<select class="form-control col-md-12" id="academic">
						</select>
					</div>
				</div>
				<div class="form-group col-md-6">
					<label class="control-label col-md-4">Chọn lớp:</label>
					<div class="col-md-8">
						<select class="form-control col-md-12" id="class">
						</select>
					</div>
				</div>
				<div class="form-group col-md-6">
					<label class="control-label col-md-4">Chọn năm:</label>
					<div class="col-md-8">
						<select class="form-control col-md-12" id="year">
						</select>
					</div>
				</div>
				<div class="form-group col-md-12 ">
					<div class="col-md-2"></div>
					<input   type="button" onclick="getClassChart()" class="btn btn-primary col-md-2" value="Xem" name="">
				</div>

			</form>
		</div>
	</div>
	<div id="graph-container">
		<canvas id="pie-chart" width="800" height="450"></canvas>
	</div>

</div>




<script>
	$(document).ready(function () {
		send_data(); // gọi hàm thực hiện load dữ liệu mặc định combobox
		$(document).ready(function () {
			setTimeout(function() {
				$(document).ready(function () {
					send_data_class();
				});
			}, 500);
		})



	});

	$("#selector").change(function() {
		send_data();
		$(document).ready(function () {
			setTimeout(function() {
				$(document).ready(function() {
					send_data_class();
				});
			}, 200);

		});
	});
	$("#academic").change(function() {
		send_data_class();
	})


</script>
@endsection
