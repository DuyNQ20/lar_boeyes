
// ----------------------------- ClassChart ------------------------------

function show_selected_id(id) {
	var selector = document.getElementById(id);
	var value = selector[selector.selectedIndex].value;
	return value;
}

// trả về danh sách các khối
function send_data() {
	var id_school = show_selected_id('selector');
	$.ajax({
		url: 'data/getAcademics',
		type: 'GET',
		dataType: 'json',
		data: { 
			id_school: id_school
		},
		success: function(data){
			console.log("Du lieu: " + data);
			document.getElementById("academic").innerHTML = data;
		}
	});
}

function getFirstYear()
{
	var year = document.getElementById('academic').options[document.getElementById('academic').selectedIndex].text;
	return year.substring(5, 9);
}
function getLastYear()
{
	var year = document.getElementById('academic').options[document.getElementById('academic').selectedIndex].text;
	return year.substring(12, 16);
}

function getYear()
{
	var year = document.getElementById('academic').options[document.getElementById('academic').selectedIndex].text;
	var year_first = year.substring(5, 9);
	var year_last = year.substring(12, 16);
	var string = "<option value='" + year_first + "'>" + year_first + " - " + year_last + "(All)</option>";
	for (var i = year_first; i < year_last; i++) {
		string += "<option value='" + year_first + "'>" + year_first + " - " + ++year_first + "</option>";
	}
	document.getElementById("year").innerHTML = string;
	console.log("Năm begin:" + year_first);
	console.log("Năm finish:" + year_last);
}

function send_data_class() {
	var id_school = show_selected_id('selector');
	var id_academic = show_selected_id('academic');

	$.ajax({
		url: 'data/getClass',
		type: 'GET',
		dataType: 'json',
		data: { 
			id_school: id_school,
			id_academic: id_academic
		},
		success: function(data){
			
			document.getElementById("class").innerHTML = data;
		}
	});
	
}

function getClassChart() {

	console.log("haha");
	var id_school = show_selected_id('selector');
	var id_academic = show_selected_id('academic');
	var id_class = show_selected_id('class');

	$.ajax({
		url: 'data/getClassEyesight',
		type: 'GET',
		dataType: 'json',
		data: { 
			schoolID: id_school,
			academicID: id_academic,
			classID: id_class
		},
		success: function(data){
			
			if (data.length == 0) {
				resetCanvas("Không có dữ liệu", "graph-container", "pie-chart");
			}
			else {console.log("độ dai class: " + data.length);
			resetCanvas("", "graph-container", "pie-chart");
				var eyesight = []; // tổng hợp độ cận
				var percent = []; // tính phần trăm
				for (var i in data) {
					var dem = 0;
					for (var j = eyesight.length - 1; j >= 0; j--) {

						if (eyesight[j] == data[i].eyesight_diopter) // kiểm tra độ cận đã có trong mảng
						{
							dem++;
							break;// nếu đã có trong mảng thì thoát vòng lặp
						}
					}
					if (dem == 0) // nếu chưa có trong mảng
					{
						eyesight.push(data[i].eyesight_diopter);// thêm vào mảng
					}
				}
				eyesight = eyesight.sort();
				for (var i = 0; i < eyesight.length; i++) {
					$.ajax({
						url: 'data/getEyesight',
						dataType: 'json',
						data: {
							check: eyesight[i], // gửi dữ liệu lên server
							classID: id_class
						},
						async: false,
						type: 'GET',
						success: function (response) {
							console.log("đây là độ dài eyesight: " + response.length);
							console.log("đây là độ dài data: " + data.length);
							var phantram = ((response.length * 100) / data.length); // tính phần trăm với độ cận eyesight[i]
							percent.push(phantram); // thêm vào mảng 
						}
					});
				}



				var graphTarget = document.getElementById("pie-chart").getContext("2d");

				graphTarget = new Chart(graphTarget, {
					type: 'pie',
					data: {
						labels: eyesight,
						datasets: [{
							label: "Hello",
							backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#ff9f40", "#ff6384", "#3f51b5", "#79df29", "#607926", "#cddc39"],
							data: percent

						}]
					},
					options: {
						title: {
							display: true,
							text: 'Biểu đồ độ cận của lớp học'
						},
						plugins: {
							datalabels: {
								color: 'white',
								font: {
									size: '15'
								},
								align: 'end',
								formatter: function (value, context) {
									return value + '%';
								}
							}

						},
						tooltips: {
							callbacks: {
								label: function (tooltipItems, data) {
									return " Độ cận " + data.labels[tooltipItems.index] +
									" : " +
									data.datasets[tooltipItems.datasetIndex].data[tooltipItems.index] +
									'%';
								}
							}
						}
					}
				});

			}
		}
	});

		
}



// ------------------ Class many years --------------------
function getClassManyYearsChart() {
	var id_school = show_selected_id('selector');
	var id_academic = show_selected_id('academic');
	var id_class = show_selected_id('class');
	var year = [];
	var year_first = getFirstYear();
	var year_last = getLastYear();

	for(var i = year_first; i < year_last; i++)
	{
		year.push(i + '-' + ( parseInt(i)+1));
	}
	console.log("năm: " + year);

	$.ajax({
		url: 'data/getClassEyesight',
		type: 'GET',
		dataType: 'json',
		async: false,
		data: { 
			schoolID: id_school,
			academicID: id_academic,
			classID: id_class
		},
		success: function(data){
			console.log("du lieu data: " + data.length);
			resetCanvas("", "chart-container", "line-chart");
			var eyesight = [];
			
			var dem = 0; 
			for (var i in data) {
				var dem = 0;
				for (var j = eyesight.length - 1; j >= 0; j--) {

						if (eyesight[j] == data[i].eyesight_diopter) // kiểm tra độ cận đã có trong mảng
						{
							dem++;
							break;// nếu đã có trong mảng thì thoát vòng lặp
						}
					}
					if (dem == 0) // nếu chưa có trong mảng
					{
						eyesight.push(data[i].eyesight_diopter);// thêm vào mảng
					}
				}
				eyesight = eyesight.sort();
				var dulieu = [];
				var mang = {};
				var lop = 1;
				var backgroundColor = ['#36a2eb','#cc65fe','#ffce56',"#ff6384","#2aac3f","#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#ff9f40", "#ff6384", "#3f51b5", "#79df29", "#607926", "#cddc39"];
				for (var j = 0; j < year.length; j++) {
					var percent = [];
					var dem = 0;
					
					var class_name = (lop++) + "a";
					console.log("tên lớp: " + class_name);
					for (var i = 0; i < eyesight.length; i++) {
						console.log("Độ cận thứ: " + eyesight[i]);
						$.ajax({
							url: 'data/getClassManyYearsEyesight',
							dataType: 'json',
							data: {
								check: eyesight[i], // gửi dữ liệu lên server
								academicID: id_academic,
								class_name: class_name
							},							
							async: false,
							type: 'GET',
							success: function (response) {
								console.log("eyesight: " + response.length);
									var phantram = ((response.length * 100) / data.length); // tính phần trăm với độ cận eyesight[i]
									
									percent.push(phantram); // thêm vào mảng 
								}
							});
					}
					mang = {
						'label': year[j],
						'backgroundColor': backgroundColor[j],
						'borderColor': backgroundColor[j],
						'hoverBackgroundColor': '#fff',
						'hoverBorderColor': '#666666',
						'fill' : false,
						'data': percent
					};
					dulieu.push(mang);
				}


				var chartdata = {
					labels: eyesight,
					datasets: dulieu
				};
				var graphTarget = $("#line-chart");
				var eyesight_show;
				barGraph = new Chart(graphTarget, {
					type: 'line',
					data: chartdata,

					options: {
						color: ['#ff0000'],
						responsive: true,
						responsiveAnimationDuration: 0,
						title: {
							display: true,
							text: 'Biểu đồ độ cận'
						},
						tooltips: {
							 mode: 'x',
							 intersect: false,
						//	 axis: 'x',
							callbacks: {
								label: function (tooltipItems, data) {
									eyesight_show = data.labels[tooltipItems.index];
									return data.datasets[tooltipItems.datasetIndex].label +
									" : " +
									data.datasets[tooltipItems.datasetIndex].data[tooltipItems.index] +
									'%';
								},
								title: function () {
									return "Độ cận: " + eyesight_show;
								}
							}
						},
						hover: {
							mode: 'nearest',
							intersect: false
						},
						scales: {
							xAxes: [{
								scaleLabel: {
									display: true,
									labelString: 'Độ cận'
								}
							}],
							yAxes: [{
								display: true,
								scaleLabel: {
									display: true,
									labelString: 'Phần trăm'
								}
							}]
						}
					}
				});
			}

		});


}

// Distroy old Canvas
function resetCanvas(text, graph_text, chart_text) {
	$('#'+chart_text).remove(); // this is my <canvas> element
	$('#'+graph_text).append('<canvas id='+chart_text+'><canvas>');
	canvas = document.querySelector('#' + chart_text);
	ctx = canvas.getContext('2d');
	ctx.canvas.width = 800; // resize to parent width
	ctx.canvas.height = 400; // resize to parent height
	var x = canvas.width / 2;
	var y = canvas.height / 2;
	ctx.font = '30pt Verdana';
	ctx.textAlign = 'left';
	ctx.fillText(text, x, y);
}



// ----------------------------- StudentChart ------------------------------
function getStudentChart() {

	var student_code = $("#student_code").val();
	var school_id = show_selected_id("selector");

	$.ajax({
		url: 'data/student-eyesight',
		type: 'GET',
		dataType: 'json',
		data: { 
			student_code: student_code,
			school_id: school_id
		},
		success: function(data)
		{
			if(data.length == 0)
			{
				resetCanvas("Không có dữ liệu", "chart-container", "line-chart");
			}
			else
			{
				resetCanvas("", "chart-container", "line-chart");
				var eyesight = [];
				var year = [];
				var name = [];
				var dem = 0; 
				for (var i in data) {

					if (dem < 1) {
						name.push(data[i].stu_name);
						console.log(name[i]);
						dem++;
					}

					eyesight.push(data[i].eyesight_diopter);
					year.push(data[i].eyesight_date);

				}

				var chartdata = {
					labels: year,
					datasets: [{
						label: name,
						backgroundColor: '#49e2ff',
						borderColor: '#f27173',
						hoverBackgroundColor: '#CCCCCC',
						hoverBorderColor: '#666666',
						fill: false,
						data: eyesight
					}]
				};



				var graphTarget = $("#line-chart");

				barGraph = new Chart(graphTarget, {
					type: 'line',
					data: chartdata,
					options: {
						responsive: true,
						title: {
							display: true,
							text: 'Biểu đồ độ cận'
						},
						tooltips: {
							mode: 'index',
							intersect: false,
						},
						hover: {
							mode: 'nearest',
							intersect: true
						},
						scales: {
							xAxes: [{
								display: true,
								scaleLabel: {
									display: true,
									labelString: 'Năm'
								}
							}],
							yAxes: [{
								display: true,
								scaleLabel: {
									display: true,
									labelString: 'Độ cận'
								}
							}]
						}
					}
				});
			}
			

		}
	});
}

//trả về danh sách các lớp của khối
function send_data_academic()
{	
	var academicyear_id = show_selected_id('academic');
	$.post("public/data.php",
	{
		academicyear_id: academicyear_id
	},
	function (data)
	{
		
		document.getElementById("class_name").innerHTML =data;
	});

	// $.ajax({
 //        url : "public/data1.php", // gửi ajax đến file result.php
 //        type : "post", // chọn phương thức gửi là post
 //        dataType:"text", // dữ liệu trả về dạng text
 //        data : { // Danh sách các thuộc tính sẽ gửi đi
 //        	academicyear_id : academicyear_id
 //        },
 //        success : function (data){
 //            // Sau khi gửi và kết quả trả về thành công thì gán nội dung trả về
 //            // đó vào thẻ div có id = result
 //            document.getElementById("class_name").innerHTML =data;
 //        }
 //    });
}




