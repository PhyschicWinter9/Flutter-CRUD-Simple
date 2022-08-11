<?php

include 'connectDB.php';

// echo "<br>";
// echo "Already to Register";
// echo "<br>";
// echo "Please Register";
// echo "<br>";
// echo "Meloned App";


$username = $_POST['username'];
$passwords = $_POST['password'];

$insert = "INSERT INTO Farmer(username,passwords)VALUES('" . $username . "','" . $passwords . "')";
$query = mysqli_query($con, $insert);
if ($query) {
    echo json_encode("Success");
}
?>

<!-- // echo " <br>";
// echo $username;
// echo " <br>";
// echo $passwords;
// echo " <br>";
// echo "Meloned App";

// $sql = "SELECT username FROM Farmer WHERE username = '" . $username . "'";

// $result = mysqli_query($con, $sql);
// $count = mysqli_num_rows($result);

// if ($count == 1) {
//     echo json_encode("Error");
// } else {

//     // $insert = "INSERT INTO Farmer(username,passwords)VALUES('" . $username . "','" . $passwords . "')";
//     // $query = mysqli_query($con, $insert);
//     // if ($query) {
//     //     echo json_encode("Success");
//     // }
// } -->