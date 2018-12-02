<?php

namespace App\Http\Controllers\Backend\Doctor;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;
class DoctorController extends Controller
{
    public function index()
    {
    	return view("backend.doctor.layout");
    }

// ---------- Độ cận từng học sinh -----------
    public function studentOne()
    {
        $schools = DB::table('tbl_school')->select('school_id', 'school_name')->get();
    	return view("backend.doctor.student", compact("schools"));
    }

        // --- Phần frontend ---
    public function studentOneFrontend()
    {
        $schools = DB::table('tbl_school')->select('school_id', 'school_name')->get();
        return view("frontend.student", compact("schools"));
    }



    
// ---------- Độ cận của một lớp học -----------
    public function classOne()  // get data for 1 year
    {
        $schools = DB::table('tbl_school')->select('school_id', 'school_name')->get();
    	return view("backend.doctor.class", compact("schools"));
    }

     public function classManyYears() // get data for many years
    {
         $schools = DB::table('tbl_school')->select('school_id', 'school_name')->get();
        return view("backend.doctor.class-many-years", compact("schools"));
    }


    
}
