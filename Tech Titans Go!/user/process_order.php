<?php 
include_once("../db.php");

if(isset($_GET['user_id'])){
    $step_1 = $_GET['step1'];
    $step_2 = $_GET['step2'];
    $step_3 = $_GET['step3'];
    $step_4 = $_GET['step4'];
    $step_5 = $_GET['step5'];
    $user_id = $_GET['user_id'];
    
    $sql_get_breakdown = "SELECT `element_name`, `price_amount` FROM `elements` 
                       WHERE `element_id` in ('$step_1','$step_2','$step_3','$step_4', '$step_5')";
    $sql_result = mysqli_query($conn, $sql_get_breakdown);
    
    $total = 0.00;
    
    if(mysqli_num_rows($sql_result) > 0){
        while($r = mysqli_fetch_assoc($sql_result)){
            echo $r['element_name'] . " = " . $r['price_amount'] . "<br>";
            $total = $total + $r['price_amount'];
        }
        ?>
        <br>
        <a href="index.php?process_order&check_out=1&step1=<?php echo $step_1;?>&step2=<?php echo $step_2;?>&step3=<?php echo $step_3;?>&step4=<?php echo $step_4;?>&step5=<?php echo $step_5;?>&u_id=<?php echo $user_id;?>" class="btn btn-success">Check Out</a>
        <?php
    }
}

if(isset($_GET['check_out'])){
    $step1 = $_GET['step1'];
    $step2 = $_GET['step2'];
    $step3 = $_GET['step3'];
    $step4 = $_GET['step4'];
    $step5 = $_GET['step5'];
    $user_id = $_GET['u_id'];

    $sql_insert_order = "INSERT INTO `orders` (`step1`, `step2`, `step3`, `step4`, `step5`, `user_id`)
    VALUES ('$step1', '$step2', '$step3', '$step4', '$step5', '$user_id')";

    
    mysqli_query($conn, $sql_insert_order)){
    
        header("location:index.php?user_id=$user_id&order=successful");

}

}
?>