<?php
    include 'connectDB.php';

    
    $con->set_charset("utf8");
    
    $sql = "SELECT period.period_ID, period.create_date, period.harvest_date, greenhouse.greenhouse_ID,greenhouse.greenhouse_name
    FROM period 
    INNER JOIN greenhouse 
    ON period.greenhouse_ID = greenhouse.greenhouse_ID";

    

    $result = mysqli_query($con, $sql);
    $arr = array();

    if($result->num_rows > 0){
        $arr = $result->fetch_all(MYSQLI_ASSOC);
        echo json_encode($arr,JSON_UNESCAPED_UNICODE);
        
    }
    else{
        echo json_encode("Failed");
    }
