<?php
include_once("../db.php");

if (isset($_POST['checkout'])) {
    $user_id = $_POST['user_id'];
    $step_1 = $_POST['step1'];
    $step_2 = $_POST['step2'];
    $step_3 = $_POST['step3'];
    $step_4 = $_POST['step4'];
    $step_5 = $_POST['step5'];

    // Calculate the total amount
    $totalAmount = 0;
    $elementIds = array($step_1, $step_2, $step_3, $step_4, $step_5);

    foreach ($elementIds as $elementId) {
        $sql = "SELECT `price_amount` FROM `elements` WHERE `element_id` = '$elementId'";
        $result = mysqli_query($conn, $sql);
        
        if ($result && $row = mysqli_fetch_assoc($result)) {
            $totalAmount += $row['price_amount'];
        } else {
            // Handle the case where an element is not found
            echo "Error: Element with ID $elementId not found.";
            exit();
        }
    }

    // Use prepared statements to prevent SQL injection
    $sql_insert_order = "INSERT INTO `orders` (`step1`, `step2`, `step3`, `step4`, `step5`, `order_amount`, `user_id`)
                         VALUES (?, ?, ?, ?, ?, ?, ?)";

    $stmt = mysqli_prepare($conn, $sql_insert_order);
    mysqli_stmt_bind_param($stmt, "iiiiiii", $step_1, $step_2, $step_3, $step_4, $step_5, $totalAmount, $user_id);

    // Execute the statement
    if (mysqli_stmt_execute($stmt)) {
        // Order successfully inserted into the database.
        // Set a success message in a session variable
        session_start();
        $_SESSION['success_message'] = "Thank you! Your order was successfully placed!.";

        // Redirect to index.php
        header("Location: user_dashboard.php");
        exit();
    } else {
        // Handle errors
        echo "Error: " . mysqli_stmt_error($stmt);
    }

    // Close the statement
    mysqli_stmt_close($stmt);

} else {
    echo "Invalid request.";
}
?>