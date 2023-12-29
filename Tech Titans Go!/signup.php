<?php
session_start();
if (isset($_SESSION["user"])) {
   header("Location: index.php");
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SIGN UP</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Lilita+One&family=Montserrat:wght@600&family=Playpen+Sans:wght@800&family=Poppins:wght@500&display=swap" rel="stylesheet">
    <style>
    body {
            background-image: url('signup.png');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh; /* Adjust as needed */
            overflow: hidden;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        
        .form-group {
            margin-top: 20px;
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
            background: none;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        label {
            font-family: 'Lilita One', sans-serif;
            font-size: 20px; /* Increase the font size of the labels */
        }

        input {
            font-size: 20px;
            background-color: rgba(255, 255, 255, 0.5);
            border: 1px solid #ccc;
            padding: 8px 25px;
            margin-bottom: 10px;
            border-radius: 5px;
        }

        input[type="submit"] {
            font-family: 'Lilita One', sans-serif;
            font-size: 20px;
            background-color: #007bff; /* Change the color of the submit button */
            color: #fff;
            cursor: pointer;
            padding: 10px 160px;
            transition: background-color 0.3s ease; /* Add transition for smoother hover effect */
        }

        input[type="submit"]:hover {
            background-color: #0056b3; /* Darker color on hover */
        }

        .home-btn {
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
        }

        .home-btn:hover {
            background-color: #6bcc6b; /* Darker green color on hover */
        }

        .error-container {
            width: 100%;
            max-width: 400px; /* Adjust the maximum width as needed */
            margin: auto;
        }

        .alert {
            margin-bottom: 10px;
        }
        </style>
</head>
<body>
    <a href="index.php" class="home-btn">HOME</a>
    <div class="container text-center">
        <?php
        require_once "db.php";
        if (isset($_POST["submit"])) {
           $ufullname = $_POST["user_fullname"];
           $uname = $_POST["username"];
           $email = $_POST["email_add"];
           $contact = $_POST["contact_number"];
           $add = $_POST["address"];
           $pw = $_POST["password"];
           $pwrepeat = $_POST["repeat_password"];


           $errors = array();
           
           if (empty($ufullname) OR empty($uname) OR empty($email) OR empty($contact) OR empty($add) OR empty($pw) OR empty($pwrepeat)) {
            array_push($errors,"All fields are required");
           }
           if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            array_push($errors, "Email is not valid");
           }
           if (strlen($pw)<10) {
            array_push($errors,"Password must be at least 10 charactes long");
           }
           if ($pw!==$pwrepeat) {
            array_push($errors,"Password does not match");
           }

           $sqlUsername = "SELECT * FROM users WHERE username = '$uname'";
           $resultUsername = mysqli_query($conn, $sqlUsername);
           $rowCountUsername = mysqli_num_rows($resultUsername);
           if ($rowCountUsername > 0) {
               array_push($errors,"Username already exists!");
           }

           $sql = "SELECT * FROM users WHERE email_add = '$email'";
           $result = mysqli_query($conn, $sql);
           $rowCount = mysqli_num_rows($result);
           if ($rowCount>0) {
            array_push($errors,"Email already exists!");
           }
           if (count($errors)>0) {
            foreach ($errors as  $error) {
                echo "<div class='alert alert-danger'>$error</div>";
            }
           }else{
            
            $sql = "INSERT INTO users (`user_fullname`, `username`, `password`, `repeat_password`, `email_add`, `contact_number`, `address`) 
                    VALUES ( ?, ?, ?, ?, ?, ?, ? )";
            $stmt = mysqli_stmt_init($conn);
            $prepareStmt = mysqli_stmt_prepare($stmt,$sql);
            if ($prepareStmt) {
                mysqli_stmt_bind_param($stmt, "sssssss", $ufullname, $uname, $pw, $pwrepeat, $email, $contact, $add);
                mysqli_stmt_execute($stmt);
                echo "<div class='alert alert-success'>You are registered successfully.</div>";
                header("Location: login.php"); // Redirect to login.php
                exit;
            }else{
                die("Something went wrong");
            }
           }
        }
        ?>
        <div id="form">
            <h1 id="heading">SIGN UP FORM</h1><br>
            <form name="form" action="signup.php" method="POST">
                <label>Fullname: </label>
                <input type="text" id="user_fullname" name="user_fullname" required><br>
                <label>Username: </label>
                <input type="text" id="username" name="username" required><br>
                <label>Email Address: </label>
                <input type="email" id="email_add" name="email_add" required><br>
                <label>Contact Number: </label>
                <input type="text" id="contact_number" name="contact_number" required><br>
                <label>Address: </label>
                <input type="text" id="address" name="address" required><br>
                <label>Password: </label>
                <input type="password" id="password" name="password" required><br>
                <label>Repeat Password: </label>
                <input type="password" id="repeat_password" name="repeat_password" required><br>
                <input type="submit" id="btn" value="Sign Up" name = "submit"/>
            </form>
            <br>
            <p><span style="font-family: 'Lilita One', sans-serif; font-size: 20px;">Already have an account? </span><a href="login.php" style="font-family: 'Lilita One', sans-serif; font-size: 20px;">LOG IN NOW!</a></p>
        </div>
        <div>
      </div>
    </div>
    </div>
</body>
</html>