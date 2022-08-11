<?php
    include 'connectDB.php';


    $farmer_ID = $_POST['farmer_ID'];
    $username = $_POST['username'];
    $password = $_POST['password'];

    // echo "PHP>";
    // echo $farmer_ID;
    // echo $username;
    // echo $password;
    

    $sql = "UPDATE Farmer SET username = '".$username."', password = '".$password."' WHERE farmer_ID = '".$farmer_ID."'";

    echo $sql;

    if($con->query($sql)){
        echo json_encode("Success");
    }
    else{
        echo "Update Failed";
    }
 
        // include('connectDB.php');

        // $farmer_ID = $_POST['farmer_ID'];
        // $username = $_POST['username'];
        // $password = $_POST['password'];

        // echo "PHP";
        // echo $farmer_ID;
        // echo $username;
        // echo $password;

        // $con->query("UPDATE user SET username = '".$username."', password =
        // '".$password."' WHERE farmer_ID = '".$farmer_ID."'");
