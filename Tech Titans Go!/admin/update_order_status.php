<?php
include_once("../db.php");

if(isset($_GET['update_order_status']) && isset($_GET['order_id'])){
    $update_status = $_GET['update_order_status'];
    $order_id = $_GET['order_id'];

    // Update the order status in the database
    $update_sql = "UPDATE `orders` SET `order_status` = '$update_status' WHERE `order_id` = '$order_id'";
    $update_result = mysqli_query($conn, $update_sql);

    if($update_result){
        // Redirect back to the previous page with a success message
        header("Location: manage_orders.php?msg=y");
        exit();
    } else {
        // Redirect back to the previous page with an error message
        header("Location: manage_orders.php?msg=n");
        exit();
    }
} else {
    // Redirect back to the previous page if the parameters are not set
    header("Location: manage_orders.php");
    exit();
}
?>
