<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js" ></script>
<body>
<h1>This is Register Page</h1>
<form >
  Name:<br>
  <input type="text" name="name" id="name" >
  <br>
  Designation:<br>
  <input type="text" name="designation" id="designation">
  <br>
  DOB:<br>
  <input type="text" name="dateOfBirth" id="dateOfBirth">
  <br>
  Salary:<br>
  <input type="text" name="salary" id="salary">
  <br>
  <br>
  <input type="submit" id="submit" value="Submit">
</form>
<script type="text/javascript">
$("#submit").click(function(){
	var arr ={};
	arr["name"] = $("#name").val();
	arr["designation"] = $("#designation").val();
	arr["dateOfBirth"] = $("#dateOfBirth").val()
	arr["salary"] = $("#salary").val();
	alert(arr);
	$.ajax({
		url: "/registerEmployee",
		headers: {
			'Accept'		: 'application/json',
			'Content-Type'	: 'application/json'
		},
		type: "POST",
		dataType: "json",
		data: JSON.stringify(arr),
		success: function(result){
			alert(result);
		}
	});
});
</script>
</body>
</html>