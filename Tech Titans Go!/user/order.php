<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Orders</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
     <link href="https://fonts.googleapis.com/css2?family=Lilita+One&family=Montserrat:wght@600&family=Playpen+Sans:wght@800&family=Poppins:wght@500&display=swap" rel="stylesheet">
    <style>
        body {
            background-image: url('img/background1.png');
            background-size: cover;
            font-family: 'Lilita One', sans-serif;
        }
        
        header {
            text-align: center;
            padding: .5em 0; /* Increased padding for both top and bottom */
            font-size: 4em;
            color: #AA336A;
            animation: floatAnimation 2s ease-in-out infinite; /* Add animation property */
        }

        @keyframes floatAnimation {
            0% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-10px); /* Adjust the distance the header floats */
            }
            100% {
                transform: translateY(0);
            }
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            background-color: #fff; /* Table background color */
            box-shadow: 0 0 100px rgba(0, 0, 0, 0.1); /* Optional box shadow */
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd; /* Border color between rows */
        }

        thead {
            background-color: #343a40; /* Header background color */
            color: #fff; /* Header text color */
        }

        .back-btn {
            position: absolute;
            top: 20px;
            left: 20px;
            font-family: 'Lilita One', sans-serif;
            font-size: 24px;
            color: black;
            text-decoration: none;
            background-color: #8aff8a; /* Light green color */
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease; /* Add transition for smoother hover effect */
            z-index: 1; /* Ensure the back button appears above other elements */
        }

        .back-btn:hover {
            background-color: #6bcc6b; /* Darker green color on hover */
        }

        .no-orders {
            text-align: center;
            font-size: 6em; /* Adjust the font size as needed */
            margin-top: 2em; /* Add margin for spacing */
        }

        .grey-column {
            background-color: grey;
        }

        .reminder {
            text-align: center;
            font-size: 1.5em; /* Adjust the font size as needed */
            color: #8B0000; /* Set the color as per your design */
            margin-top: .5em; /* Add margin for spacing */
        }

            /* Add a new class for the cancel button container */
        .cancel-btn-container {
            text-align: left; /* Align the button to the right */
        }

        .cancel-btn {
            /* Style your cancel button as needed */
            background-color: #dc3545; /* Red color for the button */
            color: #fff; /* White text color */
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
</style>
    </style>
</head>
<body>
    <a href="user_dashboard.php" class="back-btn">BACK</a>
    <header>
        <p>MY ORDERS</p>
    </header>

    <!-- Add a reminder below the header -->
    <p class="reminder">Please note that orders will arrive within 7 days from the date of purchase.</p>

<?php
include('../db.php');

session_start();

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

// Get the user ID from the parameter or session
$user_id = isset($_GET['user_id']) ? $_GET['user_id'] : $_SESSION['user_id'];

// Define the excluded order status
$excludedStatus = 'ExcludedStatus';

// Query to fetch orders with elements for the user, excluding orders with a specific status
$query = "SELECT orders.order_id, orders.order_status, elements.element_name, elements.price_amount, orders.date_ordered
          FROM orders
          JOIN elements ON orders.step1 = elements.element_id
                         OR orders.step2 = elements.element_id
                         OR orders.step3 = elements.element_id
                         OR orders.step4 = elements.element_id
                         OR orders.step5 = elements.element_id
          WHERE orders.user_id = $user_id
          AND orders.order_status <> '$excludedStatus'";

$result = mysqli_query($conn, $query);

// ... (existing code above)

// ... (existing code above)

if (mysqli_num_rows($result) > 0) {
    $currentOrderId = null;

    echo '<div class="container mt-5">';

    $notifiedOrders = array(); // Array to track notified orders

    while ($row = mysqli_fetch_assoc($result)) {
        // Check if the order is delivered or cancelled
        if ($row['order_status'] === 'D' && !in_array($row['order_id'], $notifiedOrders)) {
            echo "<div class='notification mt-3'>Your Order ID: " . $row['order_id'] . " has been Delivered!</div>";

            // Mark the order as notified
            $notifiedOrders[] = $row['order_id'];
            continue;
        }

        if ($row['order_status'] === 'C' && !in_array($row['order_id'], $notifiedOrders)) {
            echo "<div class='notification mt-3'>Your Order ID: " . $row['order_id'] . " has been Cancelled!</div>";

            // Mark the order as notified
            $notifiedOrders[] = $row['order_id'];
            continue;
        }

        // Check if the order is not cancelled or delivered
        if ($row['order_status'] !== 'C' && $row['order_status'] !== 'D') {
            if ($currentOrderId !== $row['order_id']) {
                // Calculate arrival date (7 days from the order date)
                $orderDate = new DateTime($row['date_ordered']);
                $arrivalDate = $orderDate->modify('+7 days')->format('Y-m-d');

                if ($currentOrderId !== null) {
                    echo "<td>";
                    echo "<button class='cancel-btn' data-order-id='" . $currentOrderId . "'>CANCEL MY ORDER</button>";
                    echo "</td>";
                    echo "</tr>";
                    echo "</tbody>";
                    echo "</table>";
                }
                echo "<h2 class='mt-4'>My Orders - Order ID: " . $row['order_id'] . "</h2>";
                echo "<p>Estimated Arrival Date: " . $arrivalDate . "</p>";
                echo "<table class='table table-bordered'>";
                echo "<thead class='thead-dark'><tr>";
                echo "<th class='grey-column'>ELEMENT</th>";
                echo "<th class='grey-column'>PRICE</th>";
                echo "</tr></thead>";
                echo "<tbody>";
                $currentOrderId = $row['order_id'];
            }

            echo "<tr>";
            echo "<td>" . $row['element_name'] . "</td>";
            echo "<td>₱" . $row['price_amount'] . "</td>"; // Use ₱ instead of $
            // Note: The cancel button is not added here anymore
            echo "</tr>";
        }
    }

    if ($currentOrderId !== null) {
        echo "<td>";
        echo "<button class='cancel-btn' onclick='confirmCancelOrder(" . $currentOrderId . ")'>CANCEL MY ORDER</button>";
        echo "</td>";
        echo "</tr>";
        echo "</tbody>";
        echo "</table>";
    }

    echo "</div>";
} else {
    echo "<div class='container mt-5 text-center'>";
    echo "<div style='font-size: 2em;'>No orders found. ";
    echo "<a href='customization.php' style='color: #007bff; text-decoration: underline;'>Customize My Cake Now!</a></div>";
    echo "</div>";
}

mysqli_close($conn);
?>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    function confirmCancelOrder(orderId) {
        var confirmCancel = confirm("Are you sure you want to cancel this order?");
        
        if (confirmCancel) {
            // Make an AJAX request to update the order_status to 'C'
            $.ajax({
                type: "POST",
                url: "cancel_order.php", // Create a new PHP file (cancel_order.php) to handle the update
                data: { order_id: orderId },
                success: function (response) {
                    // Handle the response if needed
                    console.log(response);
                },
                error: function (error) {
                    console.error("Error updating order status: " + error.responseText);
                }
            });
        }
    }

    $(document).ready(function () {
        $(".cancel-btn").click(function () {
            var orderId = $(this).data("order-id");
            confirmCancelOrder(orderId);
        });
    });
</script>

</body>
</html>