<?php include('includes/header.php')?>
<?php include('../includes/session.php')?>
<?php
if (isset($_GET['delete'])) {
	$delete = $_GET['delete'];
	$sql = "DELETE FROM tblstudents where std_id = ".$delete;
	$result = mysqli_query($conn, $sql);
	if ($result) {
		echo "<script>alert('Students deleted Successfully');</script>";
     	echo "<script type='text/javascript'> document.location = 'Students.php'; </script>";
		
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

	<div class="main-container">
		<div class="pd-ltr-20">
			<div class="title pb-20">
				
			</div>
			<div class="row pb-10">
				<div class="col-xl-3 col-lg-3 col-md-6 mb-20">
					<div class="card-box height-100-p widget-style3">	
						</div>
					</div>
				</div>
			</div>

			<div class="card-box mb-30">
				<div class="pd-20">
						<h2 class="text-blue h4">ALL MY LEAVE</h2>
					</div>
				<div class="pb-20">
					<table class="data-table table stripe hover nowrap">
						<thead>
							<tr>
								<th class="table-plus">LEAVE TYPE</th>
								<th>DATE FROM</th>
								<th>DATE TO</th>
								<th>NO. OF DAYS</th>								
								<th>STATUS</th>
								<th class="datatable-nosort">ACTION</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								
								 <?php 
                                    $sql = "SELECT * from tblleaves where empid = '$session_id'";
                                    $query = $dbh -> prepare($sql);
                                    $query->execute();
                                    $results=$query->fetchAll(PDO::FETCH_OBJ);
                                    $cnt=1;
                                    if($query->rowCount() > 0)
                                    {
                                    foreach($results as $result)
                                    {               ?>  

								  <td><?php echo htmlentities($result->LeaveType);?></td>
                                  <td><?php echo htmlentities($result->FromDate);?></td>
                                  <td><?php echo htmlentities($result->ToDate);?></td>
                                  <td><?php echo htmlentities($result->num_days);?></td>
                                  <td><?php $stats=$result->Status;
                                       if($stats==1){
                                        ?>
                                           <span style="color: green">Approved</span>
                                            <?php } if($stats==2)  { ?>
                                           <span style="color: red">Not Approved</span>
                                            <?php } if($stats==0)  { ?>
	                                       <span style="color: blue">Pending</span>
	                                       <?php } ?>

                                    </td>
                                    
								   <td>
									  <div class="table-actions">
										<a title="VIEW" href="view_leave.php?edit=<?php echo htmlentities($result->id);?>" data-color="#265ed7"><i class="icon-copy dw dw-eye"></i></a>
									  </div>
								   </td>
							</tr>
							<?php $cnt++;} }?>  
						</tbody>
					</table>
			   </div>
			</div>

			<?php include('includes/footer.php'); ?>
		</div>
	</div>
	<!-- js -->

	<?php include('includes/scripts.php')?>
</body>
</html>