<?php include('../includes/session.php')?>
<?php include('../includes/config.php')?>
<?php
// Assuming you have a session management system in place

// Check if the user is logged in and their department
if(isset($_SESSION['user_department'])) {
    $userDepartment = $_SESSION['user_department'];    

    // Fetch students based on the user's department
    if($userDepartment === 'IT') {
        $sql = "SELECT * FROM tblstudents WHERE department = 'IT'";
    } elseif($userDepartment === 'CSE') {
        $sql = "SELECT * FROM tblstudents WHERE department = 'CSE'";
    }

    $result = $conn->query($sql);

    if($result->num_rows > 0) {
        // Display student information
        echo "<table>";
        echo "<tr><th>Name</th><th>Department</th></tr>";
        while($row = $result->fetch_assoc()) {
            echo "<tr><td>".$row['name']."</td><td>".$row['department']."</td></tr>";
        }
        echo "</table>";
    } else {
        echo "No students found for the selected department.";
    }

   
}
?>