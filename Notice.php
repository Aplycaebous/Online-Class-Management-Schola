<!DOCTYPE html>
<html lang="en">
<head>
	<title>Notices</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="node_modules/animate.css/animate.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="node_modules/select2/dist/css/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="node_modules/perfect-scrollbar/css/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/css_bookroom/main.css">
	<link rel="stylesheet" type="text/css" href="assets/css_otherform/main.css">
	<link rel="stylesheet" type="text/css" href="assets/css_bookroom/util.css">
<!--===============================================================================================-->
      <div class="topnav" id="mytopnav">
	  	<div id = "navContent">
			  <!-- NavBar will be loaded dynamically -->
			<a href = "UserProfile.php">Profile</a>
			<a href = "Routine.php">Routine</a>
            <a class = "active" href = "Notice.php">Notice</a>
            <a href = "EvaluationSheet.php">Evaluation Sheet</a>
            <a href = "ToDo.php">To Do List</a>
		</div>
		<button style="float: right;" id = "logoutButton"><a href="index.php">Log Out</a></button>  
      </div>  
</head>
<body>
	<div class="limiter">
		<div id = "containerTable" class="container-table100">
             <!-- Contents of the table will be dynamically loaded -->
					<table>
						<thead>
							<tr class="table100-head">
								<th style="width:25%" class="column1" >Date</th>
								<th style="width:75%" class="column2">Notice</th>
							</tr>
						</thead>
						<tbody>
								<tr>
									<td class="column1">20/7/2021</td>
									<td class="column2">Schola Project work</td>
								</tr>
								<tr>
									<td class="column1">21/7/2021</td>
									<td class="column2">Eid Mubarak</td>
								</tr>
								<tr>
									<td class="column1">22/7/2021</td>
									<td class="column2">etywkvfcjebvukb3rvivbehjrhkhjvvbbfcdebbuhedv</td>
								</tr>
								<tr>
									<td class="column1">23/7/2021</td>
									<td class="column2"></td>
								</tr>
								<tr>
									<td class="column1">24/7/2021</td>
									<td class="column2"></td>
								</tr>
						</tbody>
					</table>
		</div>
	</div>
	<script src = "notice.js"></script>
</body>