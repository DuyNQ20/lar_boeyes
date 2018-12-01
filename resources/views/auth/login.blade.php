@extends('layouts.app')

@section('content')

<div class="container" style="margin-top:30; ">

    <div class="col-md-6 col-md-offset-3" style="margin-top: 50px;">
        @if(count($errors) > 0)
        <div class="alert alert-danger">
            <ul>
                @foreach($errors->all() as $error)
                <li>{!! $error !!}</li>
                @endforeach
            </ul>
        </div>
        @endif
        <div class="panel panel-primary">
            <div class="panel-heading">Login</div>
            <div class="panel-body">

                <form method="post" action="{!! route('postLogin') !!}">
                    <input type="hidden" name="_token" value="{!! csrf_token() !!}"  />
                    <!-- form group -->
                    <div class="form-group">

                        <div class="row">
                            <div class="col-md-2">Username</div>
                            <div class="col-md-10">
                                <input type="text" name="acc_username" class="form-control">
                            </div>
                        </div>
                    </div>
                    <!-- end form group -->
                    <!-- form group -->
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-2">Password</div>
                            <div class="col-md-10">
                                <input type="password" name="acc_password" class="form-control">
                            </div>
                        </div>
                    </div>
                    <!-- end form group -->
                    <!-- form group -->
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-10">
                                <input type="submit" class="btn btn-primary" value="Login" name="">
                                <input type="submit" class="btn btn-danger" value="Reset" name="">
                            </div>
                        </div>
                    </div>
                    <!-- end form group -->
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
