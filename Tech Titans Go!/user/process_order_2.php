<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link href="https://fonts.googleapis.com/css2?family=Lilita+One&family=Montserrat:wght@600&family=Playpen+Sans:wght@800&family=Poppins:wght@500&display=swap" rel="stylesheet">
    <title>Receipt</title>
    <style>
        body {
            font-family: 'Lilita One', sans-serif;
            background-image: url('img/price.png');
            background-size: cover;
            background-position: fixed;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column; /* Adjusted to column layout */
            align-items: center;
            min-height: 100vh;
        }

        .back-btn {
            position: absolute;
            top: 20px;
            left: 20px;
            font-family: 'Lilita One', sans-serif;
            font-size: 24px;
            color: black;
            text-decoration: none;
            background-color: #8aff8a;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            z-index: 1;
        }

        .back-btn:hover {
            background-color: #6bcc6b;
        }

        table {
            font-size: 21px;
            width: 50%;
            border-collapse: collapse;
            margin-top: 200px; /* Adjusted margin */
            margin-left: 100px;
            text-align: center; /* Centered table content */
            border: none;
        }

        th, td {
            padding: 10px;
        }

        th {
            background-color: #fff;
        }

        form {
            margin-top: auto; /* Push the form to the bottom */
            margin-bottom: 20px; /* Added margin at the bottom */
        }

        input[type="submit"] {
            font-size: 24px;
            background-color: #4CAF50;
            color: white;
            padding: 10px 70px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-bottom: 60px;
            margin-left: 700px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<a href="customization.php" class="back-btn">BACK</a>


<?php
include_once("../db.php");

$element1 = $element2 = $element3 = $element4 = $element5 = array("element_name" => "", "price_amount" => 0);

if (isset($_GET['user_id']) && isset($_GET['step1']) && isset($_GET['step2']) && isset($_GET['step3']) && isset($_GET['step4']) && isset($_GET['step5'])) {
    $user_id = $_GET['user_id'];
    $step_1 = $_GET['step1'];
    $step_2 = $_GET['step2'];
    $step_3 = $_GET['step3'];
    $step_4 = $_GET['step4'];
    $step_5 = $_GET['step5'];

    function getElementDetails($conn, $element_id) {
        $sql = "SELECT `element_name`, `price_amount` FROM `elements` WHERE `element_id` = '$element_id'";
        $result = mysqli_query($conn, $sql);
        return ($result) ? mysqli_fetch_assoc($result) : null;
    }

    $element1 = getElementDetails($conn, $step_1);
    $element2 = getElementDetails($conn, $step_2);
    $element3 = getElementDetails($conn, $step_3);
    $element4 = getElementDetails($conn, $step_4);
    $element5 = getElementDetails($conn, $step_5);
    
} else {
    echo "Invalid request.";
    exit();
}
?>

<table border="1">
    <tr>
        <th>STEP</th>
        <th>ELEMENT NAME</th>
        <th>PRICE</th>
    </tr>
    <tr>
        <td>Step 1</td>
        <td><?php echo $element1['element_name']; ?></td>
        <td><?php echo $element1['price_amount']; ?></td>
    </tr>
    <tr>
        <td>Step 2</td>
        <td><?php echo $element2['element_name']; ?></td>
        <td><?php echo $element2['price_amount']; ?></td>
    </tr>
    <tr>
        <td>Step 3</td>
        <td><?php echo $element3['element_name']; ?></td>
        <td><?php echo $element3['price_amount']; ?></td>
    </tr>
    <tr>
        <td>Step 4</td>
        <td><?php echo $element4['element_name']; ?></td>
        <td><?php echo $element4['price_amount']; ?></td>
    </tr>
    <tr>
        <td>Step 5</td>
        <td><?php echo $element5['element_name']; ?></td>
        <td><?php echo $element5['price_amount']; ?></td>
    </tr>
    <tr>
        <td colspan="2"><strong>Total Amount:</strong></td>
        <td><?php
            $totalAmount = $element1['price_amount'] + $element2['price_amount'] + $element3['price_amount'] + $element4['price_amount'] + $element5['price_amount'];
            echo 'P' . number_format($totalAmount, 2, '.', '');
        ?></td>
    </tr>
</table>

<form id="checkoutForm" action="checkout.php" method="post" onsubmit="return confirmCheckout()">
    <input type="hidden" name="user_id" value="<?php echo $user_id; ?>">
    <input type="hidden" name="step1" value="<?php echo $step_1; ?>">
    <input type="hidden" name="step2" value="<?php echo $step_2; ?>">
    <input type="hidden" name="step3" value="<?php echo $step_3; ?>">
    <input type="hidden" name="step4" value="<?php echo $step_4; ?>">
    <input type="hidden" name="step5" value="<?php echo $step_5; ?>">
    <input type="submit" name="checkout" value="Checkout">
</form>


<script src="../js/bootstrap.js"></script>
<script>
    function confirmCheckout() {
        // Display a confirmation dialog
        var confirmation = confirm("Are you sure you want to proceed with the checkout?");
        
        // If the user clicks "OK," the form will be submitted; otherwise, it will be canceled.
        return confirmation;
    }
</script>

</body>
</html>