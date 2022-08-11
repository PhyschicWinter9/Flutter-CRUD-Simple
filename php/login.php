<?php
include 'connectDB.php';

$username = $_POST['username'];
$password = $_POST['password'];

$sql = "SELECT * FROM Farmer WHERE username = '$username' AND password = '$password'";

$result = $con->query($sql);
if ($result->num_rows > 0) {
    $user_type = $result->fetch_assoc()['user_type'];
    echo json_encode(array('status' => 'Success', 'user_type' => $user_type));
    // echo json_encode("Success");
} else {
    echo json_encode("Error");
}
