
<?php

include_once '../config.php';
include_once '../application/model.php';
include_once '../application/controller.php';
header('Content-Type: application/json');
class data extends controller
{

    public function __construct()
    {
        parent::__construct();
        // Get dữ liệu của 1 học sinh
        if (isset($_POST['student_code']) && isset($_POST['school_id'])) {
            $student_code = isset($_POST['student_code']) ? $_POST['student_code'] : "";
            $school_id = isset($_POST['school_id']) ? $_POST['school_id'] : "";
            $data = $this->model->fetch("SELECT * FROM tbl_eyesight JOIN tbl_student ON tbl_eyesight.stu_id=tbl_student.stu_id JOIN tbl_class ON tbl_student.class_id=tbl_class.class_id WHERE tbl_student.stu_code=$student_code AND tbl_class.school_id=$school_id ORDER BY eyesight_date");
            echo json_encode($data);
        }
        // Get dữ liệu  toàn bộ của 1 lớp học theo từng năm
        else if (isset($_POST['schoolID']) && isset($_POST['academicID']) && isset($_POST['classID'])) {
            $schoolID = $_POST['schoolID'];
            $academicID = $_POST['academicID'];
            $classID = $_POST['classID'];
            if ($classID == 0) {
                $data = $this->model->fetch("SELECT tbl_eyesight.eyesight_diopter FROM tbl_school INNER JOIN tbl_academicyear ON tbl_school.school_id=tbl_academicyear.school_id
                        INNER JOIN tbl_student ON tbl_student.academicYear_id=tbl_academicyear.academicYear_id
                        INNER JOIN tbl_eyesight ON tbl_student.stu_id=tbl_eyesight.stu_id
                        WHERE tbl_school.school_id=$schoolID AND tbl_academicyear.academicYear_id=$academicID");

                echo json_encode($data);
            } else {
                $data = $this->model->fetch("SELECT tbl_eyesight.eyesight_diopter FROM tbl_school INNER JOIN tbl_academicyear ON tbl_school.school_id=tbl_academicyear.school_id
                        INNER JOIN tbl_student ON tbl_student.academicYear_id=tbl_academicyear.academicYear_id
                        INNER JOIN tbl_eyesight ON tbl_student.stu_id=tbl_eyesight.stu_id
                        WHERE tbl_school.school_id=$schoolID AND tbl_academicyear.academicYear_id=$academicID AND tbl_eyesight.class_id=$classID");

                echo json_encode($data);
            }

        } else if (isset($_POST['check'])) // Get dữ liệu độ cận của 1 lớp học
        {
            $eyesight = $_POST['check'];
            $data = $this->model->fetch("SELECT * FROM tbl_class INNER JOIN tbl_student ON tbl_class.class_id=tbl_student.class_id INNER JOIN tbl_eyesight ON tbl_student.stu_id=tbl_eyesight.stu_id WHERE tbl_class.class_id = 1 AND tbl_eyesight.eyesight_diopter=$eyesight");
            echo json_encode($data);
        }
        // Get dữ liệu lớp học để đưa vào combobox
        else if (isset($_POST['id_academic']) && isset($_POST['id_school'])) {
            $school_id = $_POST['id_school'];
            $id_academic = $_POST['id_academic'];
            $string = "<option value='0'>All</option>";
            $data = $this->model->fetch("SELECT *FROM tbl_academicYear JOIN tbl_class ON tbl_academicyear.school_id = tbl_class.school_id WHERE tbl_class.school_id=$school_id AND tbl_academicyear.academicYear_id=$id_academic");
            foreach ($data as $row) {
                $giatri = strtoupper("$row->class_name");
                $string = $string . "<option value='$row->class_id'>$giatri</option>";
            }
            echo json_encode($string);
        }
        // Get dữ liệu khối của mỗi trường học đưa vào combobox
        else if (isset($_POST['id_school'])) {
            $school_id = $_POST['id_school'];
            $year = "";
            $string = '';
            $data = $this->model->fetch("SELECT *FROM tbl_academicYear WHERE school_id=$school_id");
            foreach ($data as $row) {
                $giatri = "$row->academicYear_name ($row->academicYear_begin - $row->academicYear_end)";
                $string = $string . "<option value='$row->academicYear_id'>$giatri</option>";
            }
            echo json_encode($string);

        }
        // //$data = $this->model->fetch("SELECT * FROM tbl_class WHERE school_id='120'");
        // $chuoi = "hh";
        // // foreach ($data as $row) {
        // //     $chuoi += "<option>".$row->class_name."</option>";
        // // }
        // echo $chuoi;

        //=========================================================
        //=========== lấy dữ liệu vào combobox lớp học
        //=========================================================

        else if (isset($_POST["academicyear_id"])) {

            $string = '';
            $academicyear = $_POST["academicyear_id"];
            $arr_class = $this->model->fetch("select * from tbl_class where academicYear_id = $academicyear");
            foreach ($arr_class as $rows) {
                $giatri = $rows->class_name;
                $string = $string . "<option value='$rows->class_id'>$giatri</option>";
            }
            echo json_encode($string);
        } else if (isset($_POST["rows"])) {
            $string2 = '';
            $rows = $_POST["rows"];
            $date = date("d/m/Y");
            for ($i = 1; $i <= $rows; $i++) {
                $string2 = $string2 . "<tr id='row_add'>
				<td><input type='text' required class='form-control' name='stu_code_$i' onkeypress = 'return check_cbx()'></td>
				<td><input type='text' required class='form-control' name='stu_name_$i' ></td>
				<td>
				<select name='stu_gender_$i'style='font-size=12px;'>
				<option value='Nam'>Nam</option>
				<option value='Nu'>Nu</option>
				</select>
				</td>
				<td><input type='date' name='stu_birthday_$i' ></td>
				<td><input type='text' required class='form-control' placeholder='nơi sinh' name='stu_birthplace_$i'></td>
				<td><input type='text' required class='form-control' placeholder='địa chỉ' name='stu_address_$i'></td>
				<td><input type='text' required class='form-control' placeholder='họ tên bố' name='stu_fathername_$i'></td>
				<td><input type='text' required class='form-control' placeholder='sdt bố' name='stu_fatherphone_$i'></td>
				<td><input type='text' required class='form-control' placeholder='họ tên mẹ' name='stu_mothername_$i'></td>
				<td><input type='text' required class='form-control' placeholder='sdt mẹ' name='stu_motherphone_$i'></td>
				<td><input type='text' name='stu_createdate_$i' class='form-control txt_date' value='$date' onkeypress = 'return check()' ></td>
				</tr>";
            }
            echo json_encode($string2);
        }
    }
}

new data();

?>