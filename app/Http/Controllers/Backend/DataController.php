<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests;
use DB;

class DataController extends Controller
{
	public function getSchools()
	{
		$school = DB::table('tbl_school')->select('school_id', 'school_name')->get();
		echo json_encode($school);
	}

    // Get student eyesight info 
	public function getStudentEyesight(Request $request)
	{
		$student = DB::table('tbl_eyesight')
		->join('tbl_student', 'tbl_eyesight.stu_id','=','tbl_student.stu_id')
		->join('tbl_class','tbl_student.class_id','=','tbl_class.class_id')
		->where([
			['tbl_class.school_id', '=', $request->school_id],
			['tbl_student.stu_code', '=', $request->student_code]
		])
		->orderBy('eyesight_date')
		->select('tbl_student.stu_name','eyesight_diopter', 'eyesight_date')
		->get();
		echo json_encode($student);
	}

    // Get Academics by school_id
	public function getAcademics(request $request)
	{
		$academic = DB::table('tbl_academicyear')
		->where('tbl_academicyear.school_id', '=', $request->id_school)
		->get();
		$string = '';
		foreach ($academic as $row) {
			$giatri = "$row->academicYear_name ($row->academicYear_begin - $row->academicYear_end)";
			$string = $string . "<option value='$row->academicYear_id'>$giatri</option>";
		}
		echo json_encode($string);
	}

	public function getClass(request $request)
	{
		$string = "";
		$class = DB::table('tbl_class')
		->join('tbl_academicyear', 'tbl_academicyear.school_id','=','tbl_class.school_id')
		->where([
			['tbl_class.school_id', '=', $request->id_school],
			['tbl_academicyear.academicYear_id', '=', $request->id_academic]
		])
		->get();
		foreach ($class as $row) {
			$giatri = "$row->class_name";
			$string = $string . "<option value='$row->class_id'>$giatri</option>";
		}
		echo json_encode($string);
	}

	public function getClassEyesight(Request $request)
	{
			$ClassEyesight = DB::table('tbl_school')
			->join('tbl_academicyear', 'tbl_school.school_id','=','tbl_academicyear.school_id')
			->join('tbl_student','tbl_student.academicYear_id','=','tbl_academicyear.academicYear_id')
			->join('tbl_eyesight','tbl_student.stu_id','=','tbl_eyesight.stu_id')
			->where([
				['tbl_school.school_id', '=', $request->schoolID],
				['tbl_academicyear.academicYear_id', '=', $request->academicID],
				['tbl_eyesight.class_id', '=', $request->classID]
			])
			->select('tbl_eyesight.eyesight_diopter')
			->get();

		
		// $ClassEyesight = DB::select("SELECT tbl_eyesight.eyesight_diopter FROM tbl_school INNER JOIN tbl_academicyear ON tbl_school.school_id=tbl_academicyear.school_id
		// 	INNER JOIN tbl_student ON tbl_student.academicYear_id=tbl_academicyear.academicYear_id
		// 	INNER JOIN tbl_eyesight ON tbl_student.stu_id=tbl_eyesight.stu_id
		// 	WHERE tbl_school.school_id=$request->schoolID AND tbl_academicyear.academicYear_id=$request->academicID AND tbl_eyesight.class_id= $request->classID");
		
		echo json_encode($ClassEyesight);
	}

	public function getEyesight(Request $request)
	{
		// $student = DB::table('tbl_class')
		// 	->join('tbl_student', 'tbl_class.class_id', '=', 'tbl_student.class_id')
  //           ->join('tbl_eyesight', 'tbl_student.stu_id', '=', 'tbl_eyesight.stu_id')
		// 	->where([
		// 		['tbl_class.class_id', '=', $request->classID],	
		// 		['tbl_eyesight.eyesight_diopter', '=', $request->check]
		// 	])
		// 	->get();
		$student = DB::select("SELECT * FROM `tbl_eyesight` WHERE class_id = $request->classID AND eyesight_diopter = $request->check");
		echo json_encode($student) ;
	}
}
