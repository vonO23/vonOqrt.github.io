<?php
include('../db.php');

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["order_id"])) {
    $orderId = $_POST["order_id"];

    // Update the order_status to 'C' for the given order_id
    $updateQuery = "UPDATE orders SET order_status = 'C' WHERE order_id = $orderId";
    $result = mysqli_query($conn, $updateQuery);

    if ($result) {
        echo "Order successfully cancelled!";
    } else {
        echo "Error updating order status!";
    }

    mysqli_close($conn);
} else {
    echo "Invalid request!";
}
?>
