<?php
session_start();
require 'db.php';

if (isset($_POST['username']) && isset($_POST['password'])) {
    $uname = $_POST['username'];
    $pw = $_POST['password'];
    $result = mysqli_query($conn, "SELECT * FROM `users` 
                                    WHERE `username` = '$uname'
                                    AND `password`= '$pw'");
    $row = mysqli_fetch_assoc($result);

    if (mysqli_num_rows($result) > 0) {
        $_SESSION['login'] = true;
        $_SESSION['user_type'] = $row['user_type'];
        $_SESSION['user_id'] = $row['user_id'];

        if ($row["user_type"] == "U") {
            // User login process
            header("Location: user/user_dashboard.php");
            exit();  // Make sure to exit after redirecting
        } elseif ($row["user_type"] == "A") {
            // Admin login process
            header("Location: admin/admin_dashboard.php");
            exit();  // Make sure to exit after redirecting
        } else {
            echo "<script> alert ('Invalid User Type'); </script>";
        }
    } else {
        echo "<script> alert ('Wrong Password or User Not Registered'); </script>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LOGIN</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link href="https://fonts.googleapis.com/css2?family=Lilita+One&family=Montserrat:wght@600&family=Playpen+Sans:wght@800&family=Poppins:wght@500&display=swap" rel="stylesheet">
    <style>
        body {
            background-image: url('login.png');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            overflow: hidden;
            margin: 0;
        }

        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            background-color: #fff;
            padding: 10px;
            z-index: 999;
        }

        #heading {
            font-family: 'Lilita One', sans-serif;
            font-size: 50px;
        }

        #form {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        label {
            font-family: 'Lilita One', sans-serif;
            font-size: 20px;
        }

        input {
            display: flex;
            font-size: 20px;
            background-color: rgba(255, 255, 255, 0.5);
            border: 1px solid #ccc;
            padding: 20px 50px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .password-container {
            display: flex;
            align-items: center;
        }

        .eye-icon {
            cursor: pointer;
            width: 20px;
            height: 20px;
            margin-left: -30px;
        }

        input[type="submit"] {
            font-family: 'Lilita One', sans-serif;
            font-size: 20px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            padding: 10px 160px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .home-btn {
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
        }

        .home-btn:hover {
            background-color: #6bcc6b;
        }
    </style>
</head>
<body>
    <a href="index.php" class="home-btn">HOME</a>
    <div id="form">
        <h1 id="heading">LOGIN FORM</h1><br><br>
        <form name="form" action="login.php" method="POST" required onsubmit="return isvalid()">
            <label>Username: </label>
            <input type="text" id="username" name="username"><br><br>
            <label>Password: </label>
            <div class="password-container">
                <input type="password" id="password" name="password" required>
                <img src="eye.png" class="eye-icon" id="eye-icon" alt="Toggle Password Visibility">
            </div><br><br>
            <input type="submit" id="btn" value="Login" name="submit"/>
        </form>
        <br>
        <p><span style="font-family: 'Lilita One', sans-serif; font-size: 20px;">Don't have an account? </span><a href="signup.php" style="font-family: 'Lilita One', sans-serif; font-size: 20px;">SIGN UP NOW!</a></p>
    </div>

        <script>
        function isvalid() {
            var user = document.form.username.value;
            if (user.length == "") {
                alert("Enter username!");
                return false;
            }
        }

        // Add this script for password visibility toggle
        document.getElementById("eye-icon").addEventListener("click", function() {
            var passwordInput = document.getElementById("password");
            var eyeIcon = document.getElementById("eye-icon");

            if (passwordInput.type === "password") {
                passwordInput.type = "text";
                eyeIcon.src = "eye-off.png"; // Change to your eye-off icon image
            } else {
                passwordInput.type = "password";
                eyeIcon.src = "eye.png"; // Change to your eye icon image
            }
        });
    </script>

</body>
</html>
