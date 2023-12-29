<?php
include_once("../db.php");

// Check if the update action is triggered
if (isset($_GET['update_element']) && isset($_GET['ing_id']) && isset($_GET['action'])) {
    $elementId = $_GET['ing_id'];
    $action = $_GET['action'];

    
    
    // Update the element_status based on the action
    $status = ($action == 'available') ? 'A' : 'U';

    // Update the database
    $sql_update_status = "UPDATE elements SET element_status = '$status' WHERE element_id = $elementId";
    $result = mysqli_query($conn, $sql_update_status);

    if ($result) {
        header("Location: manage_elements.php?msg=y");
        exit();
    } else {
        header("Location: manage_elements.php?msg=n");
        exit();
    }
}
?>

<html>
<head>
    <meta charset="UTF-16">
    <title>Manage Elements</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../my.css">
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

        .card {
            background: none;
        }
    </style>
    <!-- Add the following script for notifications -->
    <script>
        function showNotification(elementName, status) {
            var notificationMessage = 'Element ' + elementName + ' is now ' + status + '.';
            alert(notificationMessage);
        }
    </script>
</head>
<body id="home-page">
    <a href="admin_dashboard.php" class="back-btn">BACK</a>
    <header>
        <p>MANAGE ELEMENTS</p>
    </header>
            <div class="col-10 pt-6 mx-auto my-auto">
                <div class="row">
                </div>
                <div class="row">
                    <?php
                    $sql_fetch_ing = "SELECT * FROM elements";
                    $ing_result = mysqli_query($conn, $sql_fetch_ing);
                    
                    while ($row = mysqli_fetch_array($ing_result)){
                        ?>
                        <div class="card px-0 col-3">
                            <?php if($row['element_img'] != ''){ ?>
                                <img src="../user/img/<?php echo $row['element_img'];?>" style="max-height:200px" class="object-fit-cover card-img-top img-fluid">
                            <?php  } ?>
                            <h6 class="ms-2 fs-5"><?php echo $row['element_name'];?></h6>
                            <div class="card-body">
                                <em class="card-link"><?php echo "Php " . number_format($row['price_amount'],2);?></em>
                            </div>
                            <div class="card-footer">
                                <!-- Add onclick events to call the showNotification function -->
                                <a href="?update_element&page=1&ing_id=<?php echo $row['element_id'];?>&action=available"
                                    class="btn btn-sm btn-success"
                                    onclick="showNotification('<?php echo $row['element_name'];?>', 'Available')">Available</a>
                                <a href="?update_element&page=1&ing_id=<?php echo $row['element_id'];?>&action=unavailable"
                                    class="btn btn-sm btn-danger"
                                    onclick="showNotification('<?php echo $row['element_name'];?>', 'Unavailable')">Unavailable</a>
                            </div>
                        </div>
                    <?php } ?>
                </div>    
            </div>
        </div>
    </div>


    <script src="../js/bootstrap.js"></script>
</body>
</html>

