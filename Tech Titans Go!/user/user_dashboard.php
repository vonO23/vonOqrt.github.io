<?php
include_once("../db.php"); 
session_start();

// Check if user is not logged in, then redirect to the login page
if (!isset($_SESSION['user_id'])) {
    header("location: ../index.php?msg=no_user_found");   
    exit();
} else {
    $user_id = $_SESSION['user_id'];
}

// Check if the logout button is clicked
if (isset($_POST['logout'])) {
    // Unset all session variables
    session_unset();
    // Destroy the session
    session_destroy();
    // Redirect to login.php with a success message
    header("Location: ../login.php?logout=1");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HELLO, USER!</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link href="https://fonts.googleapis.com/css2?family=Lilita+One&family=Montserrat:wght@600&family=Playpen+Sans:wght@800&family=Poppins:wght@500&display=swap" rel="stylesheet">
    <style>
         body {
            background-image: url('img/user_dashboard.png');
            background-size: cover;
            font-family: 'Lilita One', sans-serif;
        }
        
        header {
            text-align: center;
            padding: .5em 0; /* Increased padding for both top and bottom */
            font-size: 3.5em;
            color: white;
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

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 80vh;
        }

        .success-message {
            background-color: #4CAF50;
            color: #fff;
            padding: 10px;
            text-align: center;
            margin-bottom: 20px;
        }

        .btn-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 10px; /* Adjusted margin-top */
        }

        btn-container button {
            margin-top: 10px; /* Adjusted margin-top */
        }

        /* Style for "View My Orders!" button */
        .btn-view-orders {
            margin-right: 30px;
            font-size: 3em;
            padding: 50px 140px;
            background-color: transparent; /* Set background color to transparent */
            border: none; 
        }

        /* Style for "Customize My Cake!" button */
        .btn-customize-cake {
            margin-right: 30px;
            font-size: 3em;
            padding: 50px 110px;
            background-color: transparent; /* Set background color to transparent */
            border: none; 
        }

        .btn-view-orders:hover {
            background-color: #4cb981 !important; /* Override hover effect */
        }

        .btn-customize-cake:hover {
            background-color: #4cb981 !important;
        }

        .btn-logout {
            position: absolute;
            top: 20px;
            left: 20px;
            font-family: 'Lilita One', sans-serif;
            font-size: 24px;
            color: white;
            text-decoration: none;
            background-color: red; /* Light green color */
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease; /* Add transition for smoother hover effect */
            z-index: 1; /* Ensure the back button appears above other elements */
            border: none;
        }

        .btn-logout:hover {
            background-color: #8B0000; /* Darker green color on hover */
        }
    </style>
</head>
<body>
<form id="logoutForm" action="../login.php" method="post">
    <button type="button" onclick="confirmLogout()" class="btn btn-danger btn-logout">LOGOUT</button>
</form>
<header>
    <p>WELCOME TO YOUR DASHBOARD!</p>
</header>
<div class="container">
    <!-- Your existing HTML content -->

    <?php if (isset($_SESSION['success_message'])) : ?>
        <div class="alert success-message">
            <?php echo $_SESSION['success_message']; ?>
        </div>
        <?php unset($_SESSION['success_message']); ?>
    <?php endif; ?>

    <form action="order.php" method="get">
        <input type="hidden" name="user_id" value="<?php echo $_SESSION['user_id']; ?>">
        <button type="submit" class="btn btn-primary btn-xl btn-view-orders">View My Orders!</button>
    </form><br>

    <form action="customization.php" method="get">
        <button type="submit" class="btn btn-success btn-xl btn-customize-cake">Customize My Cake!</button>
    </form>
</div>

<script>
    function confirmLogout() {
        var confirmLogout = confirm("Are you sure you want to log out?");
        if (confirmLogout) {
            document.getElementById("logoutForm").submit();
        }
    }
</script>

</body>
</html>