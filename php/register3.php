<?php

include 'connectDB.php';

$username = $_POST['username'];
$passwords = $_POST['password'];



// echo $name_store;
// echo $latitude;
// echo $longitude;
// echo $weight;
// echo $price;

$sql = "insert into Farmer (username,password) values (?,?)";


$statement = $con->prepare($sql);
$statement->bind_param("ss", $username, $passwords);

if ($statement->execute()) {
    // print "Success!!" .  $con->insert_id;
    // echo $statement->affected_rows;
    // header("Location: ../registerStore.php?status=success");
     echo ("Success");
} else {
    // die('Error : ' . $con->error);
    echo ("Error");
}

$statement->close();
$con->close();
