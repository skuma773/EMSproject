<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js" ></script>
<script src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
  <script src="//cdn.datatables.net/1.10.12/js/dataTables.bootstrap.min.js"></script>
  
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.css" />
  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/css/dataTables.bootstrap.min.css" />
  <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.1.0/css/responsive.bootstrap.min.css" type="text/css" />
  <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.2.1/css/buttons.bootstrap.min.css" type="text/css" />
  
<script type='text/javascript' src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>
  
<title>Insert title here</title>
</head>

<body style="background-color: #ebebe0;">
	<div class="col-xs-12">
	<div allign="center">Employee Data</div>
		<div id="userTable">
			<table id="test" class="table table-striped table-bordered table-hover" border="1" cellspacing="0">
				<thead>
					<th>Name</th>
					<th>Designation</th>
					<th>DOB</th>
					<th>Salary</th>
					<th>Options</th>
				</thead>
				<tbody>
					<c:forEach var="employee" items="${list}">
						<tr>
							<th>${employee.name}</th>
							<th>${employee.designation}</th>
							<th>${employee.dateOfBirth}</th>
							<th>${employee.salary}</th>
							<th>
								<button class="edit" empId="${employee.id}" name="${employee.name}" designation="${employee.designation}" dob="${employee.dateOfBirth}" salary="${employee.salary}">Edit</button>
								<button class="delete" empId="${employee.id}">Delete</button>
							</th>
						</tr>
					</c:forEach>
				</tbody>
				
			</table>
		</div>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$('#test').DataTable();
	$(".delete").click(function(){
		var empId1 = $(this).attr('empId');
		var employee = {};
		employee['id'] = empId1;
		 $.ajax({
	            url: '/deleteEmpData',
	            type: 'post',
	            contentType: 'application/json',
	            success: function (data) {
	            	if(data == "success"){
						alert("Record deleted")	
						
	                }else{
	                	alert("Fail to delete");
	                }
	            	location.reload();
	            },
	            error: function ( error ) {
	            	alert(error);
	            },
	            data: JSON.stringify(employee)
	        });
	});
	
	$(".edit").click(function(){
		renderContent(this);
	});
	function renderContent(element){
		bootbox.dialog({
			title: "Edit User",
			message: renderPopupContent(element),
			buttons: {
				ok: {
					label: "Submit",
					className: 'btn-success',
					callback:function(){
							var type="POST";
							var data=getDataFromForm();
							$.ajax({
								url: "/editEmployeeData",
								contentType: 'application/json',
								type: "POST",
								data: JSON.stringify(data),
								success: function(result){
									if(resul=="success"){
										alert("Edited Successfully");
									}else{
										alert("Fail to update Data");
									}
									location.reload();
								}
							}); 


					}
				},

				cancel: {
					label: "Cancel",
					className: 'btn-danger',

				},

			}
		
	});
	}
	function renderPopupContent(elem){
		var arr=[];

		arr.push('<div class="form-horizontal" id="updateStatus_dlg">');
		arr.push('    <div class="form-group hidden">');
		arr.push('        <label class="col-sm-4 control-label no-padding-right">UserId</label>');
		arr.push('        <div class="col-sm-5">');
		arr.push('            <input type="text" class="form-control" id="id" value="'+$(elem).attr('empId')+'" readonly/>');
		arr.push('        </div>');
		arr.push('    </div>');


		arr.push('    <div class="form-group">');
		arr.push('        <label class="col-sm-4 control-label no-padding-right">Name</label>');
		arr.push('        <div class="col-sm-5">');
		arr.push('            <input type="text" class="form-control" id="name" value="'+$(elem).attr('name')+'"/>');
		arr.push('        </div>');
		arr.push('    </div>');
		
		arr.push('    <div class="form-group">');
		arr.push('        <label class="col-sm-4 control-label no-padding-right">Designation</label>');
		arr.push('        <div class="col-sm-5">');
		arr.push('            <input type="text" class="form-control" id="designation" value="'+$(elem).attr('designation')+'"/>');
		arr.push('        </div>');
		arr.push('    </div>');
		
		arr.push('    <div class="form-group">');
		arr.push('        <label class="col-sm-4 control-label no-padding-right">DOB</label>');
		arr.push('        <div class="col-sm-5">');
		arr.push('            <input type="text" class="form-control" id="dateOfBirth" value="'+$(elem).attr('dob')+'"/>');
		arr.push('        </div>');
		arr.push('    </div>');
		
		arr.push('    <div class="form-group">');
		arr.push('        <label class="col-sm-4 control-label no-padding-right">Salary</label>');
		arr.push('        <div class="col-sm-5">');
		arr.push('            <input type="text" class="form-control" id="salary" value="'+$(elem).attr('salary')+'"/>');
		arr.push('        </div>');
		arr.push('    </div>');
		
		arr.push('</div>');
		return arr.join('');
	}
	function getDataFromForm(){
		var data = {};
		data['id'] = $("#id").val();
		data['name'] = $("#name").val();
		data['designation'] = $("#designation").val();
		data['dateOfBirth'] = $("#dateOfBirth").val();
		data['salary'] = $("#salary").val();
		return data;
		
	}
});
</script>
</html>