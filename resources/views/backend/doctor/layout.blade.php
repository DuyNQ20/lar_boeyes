@extends('layouts.app')

<!--------------- content  ------------------->
<style type="text/css">
	.navbar {
    margin-bottom: 0 !important;
}
</style>
@extends('auth.logout')
@section('content')
<div class="content">
	<div class="container-fluid">
		<div class="col-md-2">
			<div class="title-menu">Tài khoản bác sĩ</div>

			<div class="menu">

				<ul>
					<li><a href="#"><span class="glyphicon glyphicon-home"></span>Trang chủ<span class="glyphicon glyphicon-chevron-right" style="font-size: 9px;"></span></a>
						<ul class="sub-menu">

						</ul>
					</li>
					<li><a href="#"><span class="glyphicon glyphicon-user"></span>Thông tin cá nhân
						<span class="glyphicon glyphicon-chevron-right" style="font-size: 9px;"></span></a>


					</li>

					<li>
						<a href="#"><span class="glyphicon glyphicon-signal"></span>Tổng hợp thông kê<span class="glyphicon glyphicon-chevron-right" style="font-size: 9px;"></a>
							<ul class="sub-menu">
								<li><a href="{!! url('doctor/student-one') !!}" >Thống kê của một học sinh</a></li>
								<li><a href="{!! url('doctor/class-one') !!}">Thống kê của một lớp</a></li>
								<li><a href="{!! url('doctor/class-many-years') !!}">Thống kê của một lớp theo từng năm</a></li>
								<li><a href="SoSanhCacTruong.html">TK các trường theo năm</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-md-10">
				<div class="row">
					<div class="col-md-12">
						<div id="result">

							@yield('content-doctor')
					</div>

				</div>
			</div>
		</div>
	</div>
</div>
<footer>
	<div class="container-fluid">
		<div class="col-md-12"></div>
	</div>
</footer>
@endsection
