<?php include('includes/header.php')?>
<?php include('../includes/session.php')?>
<?php
if (isset($_POST['add_Students'])) {
    $fname = $_POST['firstname'];
    $lname = $_POST['lastname'];
    $email = $_POST['email'];
    $password = md5($_POST['password']);
    $gender = $_POST['gender'];
    $dob = $_POST['dob'];
    $department = $_POST['department'];
    $address = $_POST['address'];
    $leave_days = $_POST['leave_days'];
    $user_role = $_POST['user_role'];
    $phonenumber = $_POST['phonenumber'];
    $status = 1;

    $query = mysqli_query($conn, "select * from tblstudents where EmailId = '$email'") or die(mysqli_error());
    $count = mysqli_num_rows($query);

    if ($count > 0) { ?>
        <script>
            alert('Data Already Exist');
        </script>
    <?php } else {
        if ($user_role === 'HOD') {
            // Insert into HOD Table
            mysqli_query($conn, "INSERT INTO tblHOD(FirstName, LastName, EmailId, Password, Gender, Dob, Department, Address, Av_leave, role, Phonenumber, Status, location) VALUES('$fname', '$lname', '$email', '$password', '$gender', '$dob', '$department', '$address', '$leave_days', '$user_role', '$phonenumber', '$status', 'NO-IMAGE-AVAILABLE.jpg')");
        } elseif ($user_role === 'Faculty') {
            // Insert into Faculty Table
            mysqli_query($conn, "INSERT INTO tblFaculty(FirstName, LastName, EmailId, Password, Gender, Dob, Department, Address, Av_leave, role, Phonenumber, Status, location) VALUES('$fname', '$lname', '$email', '$password', '$gender', '$dob', '$department', '$address', '$leave_days', '$user_role', '$phonenumber', '$status', 'NO-IMAGE-AVAILABLE.jpg')");
        } elseif ($user_role === 'Students') {
            // Insert into Student Table
            mysqli_query($conn, "INSERT INTO tblstudents(FirstName, LastName, EmailId, Password, Gender, Dob, Department, Address, Av_leave, role, Phonenumber, Status, location) VALUES('$fname', '$lname', '$email', '$password', '$gender', '$dob', '$department', '$address', '$leave_days', '$user_role', '$phonenumber', '$status', 'NO-IMAGE-AVAILABLE.jpg')");
        } else {
            // Handle any other user roles or error cases here
        }
    ?>
        <script>
            alert('Students Records Successfully Added');
        </script>;
        <script>
            window.location = "Students.php";
        </script>
<?php
    }
}
?>

<body>
	<div class="pre-loader">
		<div class="pre-loader-box">
			<div class="loader-logo"><img src="../vendors/images/ksrct-blue.png" alt=""></div>
			<div class='loader-progress' id="progress_div">
				<div class='bar' id='bar1'></div>
			</div>
			<div class='percent' id='percent1'>0%</div>
			<div class="loading-text">
				Loading...
			</div>
		</div>
	</div>

	<?php include('includes/navbar.php')?>

	<?php include('includes/right_sidebar.php')?>

	<?php include('includes/left_sidebar.php')?>

	<div class="mobile-menu-overlay"></div>

	<div class="mobile-menu-overlay"></div>

	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>Students Portal</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">Students Module</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>

				<div class="pd-20 card-box mb-30">
					<div class="clearfix">
						<div class="pull-left">
							<h4 class="text-blue h4">Students Form</h4>
							<p class="mb-20"></p>
						</div>
					</div>
					<div class="wizard-content">
						<form metHOD="post" action="">
							<section>
								<div class="row">
									<div class="col-md-4 col-sm-12">
										<div class="form-group">
											<label >First Name :</label>
											<input name="firstname" type="text" class="form-control wizard-required" required="true" autocomplete="off">
										</div>
									</div>
									<div class="col-md-4 col-sm-12">
										<div class="form-group">
											<label >Last Name :</label>
											<input name="lastname" type="text" class="form-control" required="true" autocomplete="off">
										</div>
									</div>
									<div class="col-md-4 col-sm-12">
										<div class="form-group">
											<label>Email Address :</label>
											<input name="email" type="email" class="form-control" required="true" autocomplete="off">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-4 col-sm-12">
										<div class="form-group">
											<label>Password :</label>
											<input name="password" type="password" placeholder="**********" class="form-control" required="true" autocomplete="off">
										</div>
									</div>
									<div class="col-md-4 col-sm-12">
										<div class="form-group">
											<label>Gender :</label>
											<select name="gender" class="custom-select form-control" required="true" autocomplete="off">
												<option value="">Select Gender</option>
												<option value="male">Male</option>
												<option value="female">Female</option>
											</select>
										</div>
									</div>
									<div class="col-md-4 col-sm-12">
										<div class="form-group">
											<label>Phone Number :</label>
											<input name="phonenumber" type="text" class="form-control" required="true" autocomplete="off">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-4 col-sm-12">
										<div class="form-group">
											<label>Date Of Birth :</label>
											<input name="dob" type="text" class="form-control date-picker" required="true" autocomplete="off">
										</div>
									</div>
									<div class="col-md-4 col-sm-12">
										<div class="form-group">
											<label>Address :</label>
											<input name="address" type="text" class="form-control" required="true" autocomplete="off">
										</div>
									</div>
									<div class="col-md-4 col-sm-12">
										<div class="form-group">
											<label>Department :</label>
											<select name="department" class="custom-select form-control" required="true" autocomplete="off">
												<option value="">Select Department</option>
													<?php
													$query = mysqli_query($conn,"select * from tbldepartments");
													while($row = mysqli_fetch_array($query)){
													
													?>
													<option value="<?php echo $row['DepartmentShortName']; ?>"><?php echo $row['DepartmentName']; ?></option>
													<?php } ?>
											</select>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-4 col-sm-12">
										<div class="form-group">
											<label>Students Leave Days :</label>
											<input name="leave_days" type="number" class="form-control" required="true" autocomplete="off">
										</div>
									</div>
									
									<div class="col-md-4 col-sm-12">
										<div class="form-group">
											<label>User Role :</label>
											<select name="user_role" class="custom-select form-control" required="true" autocomplete="off">
												<option value="">Select Role</option>
												
												<option value="Faculty">Faculty</option>
												<option value="Students">Student</option>
											</select>
										</div>
									</div>

									<div class="col-md-4 col-sm-12">
										<div class="form-group">
											<label style="font-size:16px;"><b></b></label>
											<div class="modal-footer justify-content-center">
												<button class="btn btn-primary" name="add_Students" id="add_Students" data-toggle="modal">Add&nbsp;Students</button>
											</div>
										</div>
									</div>
								</div>
							</section>
						</form>
					</div>
				</div>

			</div>
			<?php include('includes/footer.php'); ?>
		</div>
	</div>
	<!-- js -->
	<?php include('includes/scripts.php')?>
</body>
</html>