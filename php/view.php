<?php
include 'connectDB.php';



$sql = "SELECT * FROM Farmer";

$result = $con->query($sql);
$arr = [];
while ($row = $result->fetch_assoc()) {
    $arr[] = $row;
}
echo json_encode($arr);

// if ($result->num_rows > 0) {
//     $farmer_id = $result->fetch_assoc()['farmer_id'];
//     echo json_encode(array('status' => 'Success', 'farmer_id' => $farmer_id));
//     // echo json_encode("Success");
// } else {
//     echo json_encode("Error");
// }
?>