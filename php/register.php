<?php

//Define your Server host name here.
$HostName = "localhost";

//Define your MySQL Database Name here.
$DatabaseName = "relaxlik_meloned";

//Define your Database User Name here.
$HostUser = "relaxlik_meloned";

//Define your Database Password here.
$HostPass = "0908672636";

// Creating MySQL Connection.
$con = mysqli_connect($HostName, $HostUser, $HostPass, $DatabaseName);

// Storing the received JSON into $json variable.
$json = file_get_contents('php://input');

// Decode the received JSON and Store into $obj variable.
$obj = json_decode($json, true);

// // Getting Username from $obj object.
// $famer_id = $obj['famer_id'];

// Getting Username from $obj object.
$username = $obj['username'];

// Getting Password from $obj object.
$password = $obj['password'];

// Getting Usertype from $obj object.
$user_type = $obj['user_type'];

// Getting img from $obj object.
$img = $obj['img'];

// Checking whether Email is Already Exist or Not in MySQL Table.
$CheckSQL = "SELECT * FROM Farmer WHERE username='$username'";

// Executing Email Check MySQL Query.
$check = mysqli_fetch_array(mysqli_query($con, $CheckSQL));


if (isset($check)) {

    $usernameExist = '๊Username Already Exist, Please Try Again With New Username..!';

    // Converting the message into JSON format.
    $existusernameJSON = json_encode($usernameExist);

    // Echo the message on Screen.
    echo $existusernameJSON;
} else {

    // Creating SQL query and insert the record into MySQL database table.
    $Sql_Query = "insert into Famer (username,passsword,user_type) values ('$username','$password','$user_type')";


    if (mysqli_query($con, $Sql_Query)) {

        // If the record inserted successfully then show the message.
        $MSG = 'Registered Successfully';

        // Converting the message into JSON format.
        $json = json_encode($MSG);

        // Echo the message.
        echo $json;
    } else {

        echo 'Try Again';
    }
}
mysqli_close($con);
