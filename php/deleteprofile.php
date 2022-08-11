<?php
    include 'connectDB.php';

    $farmer_ID = $_POST['farmer_ID'];
  

    $sql = "DELETE FROM Farmer WHERE farmer_ID = '$farmer_ID'";

 
    if($con->query($sql)){
        echo json_encode("Success");
    }
    else{
        echo "Delete Failed";
    }
