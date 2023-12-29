<?php
session_start();

// Unset all session variables
session_unset();

// Destroy the session
session_destroy();

// Redirect to login page with a success message
$_SESSION['success_message'] = "Successfully Logged Out.";
header("Location: login.php");
exit();
?>