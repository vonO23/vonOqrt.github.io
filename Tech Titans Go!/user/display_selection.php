<?php
session_start();
require '../db.php'; // Include your database connection file

if (isset($_GET['process_order'])) {
    // Get the selected element IDs from the form
    $step1_id = $_GET['step1'];
    $step2_id = $_GET['step2'];
    $step3_id = $_GET['step3'];
    $step4_id = $_GET['step4'];
    $step5_id = $_GET['step5'];

    // Query the database to get the element_img for each selected element
    $sql_get_selected_elements = "SELECT * FROM `elements` WHERE `element_id` IN ('$step1_id', '$step2_id', '$step3_id', '$step4_id', '$step5_id')";
    $result_selected_elements = mysqli_query($conn, $sql_get_selected_elements);

    if (mysqli_num_rows($result_selected_elements) > 0) {
        ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Display Selection</title>
    <link href="https://fonts.googleapis.com/css2?family=Lilita+One&family=Montserrat:wght@600&family=Playpen+Sans:wght@800&family=Poppins:wght@500&display=swap" rel="stylesheet">
    <style>
    body {
        font-family: 'Lilita One', sans-serif;
        margin-bottom: 610px;
        text-align: center;
        background-image: url('img/selection.png');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        overflow: hidden; /* Prevent scrolling */
    }

    .col-6 {
        position: relative;
        box-sizing: border-box;
    }

    /* Add custom styles for each image */
    .img-1 {
        position: absolute;
        background-size: cover;
        background-position: center;
        top: 0;
        left: 0;
        max-width: 100%;
        margin-top: -100px; /* Adjusted margin-top value */
    }

    .img-2 {
        position: absolute;
        background-size: cover;
        background-position: center;
        top: 0;
        left: 0;
        max-width: 100%;
        margin-top: -100px; /* Adjusted margin-top value */
    }

    .img-3 {
        position: absolute;
        top: 0;
        left: 0;
        max-width: 100%;
        margin-top: -100px; /* Adjusted margin-top value */
    }

    .img-4 {
        position: absolute;
        top: 0;
        left: 0;
        max-width: 100%;
        margin-top: -100px; /* Adjusted margin-top value */
    }

    .img-5 {
        position: absolute;
        top: 0;
        left: 0;
        max-width: 100%;
        margin-top: -100px; /* Adjusted margin-top value */
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

    @keyframes floatAnimation {
        0% {
            transform: translateY(0);
        }
        50% {
            transform: translateY(-10px);
        }
        100% {
            transform: translateY(0);
        }
    }

    .continue-btn {
        position: absolute;
        top: 20px;
        right: 20px; /* Adjusted position to the upper right */
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

.continue-btn:hover {
    background-color: #6bcc6b;
}
    /* Add more classes for additional images as needed */
</style>
</head>
<body>
    <a href="customization.php" class="back-btn">BACK</a>
    <h1 style="font-size: 4em; text-align: center; color: #AA336A; animation: floatAnimation 2s ease-in-out infinite;">Your Cake Selection</h1>
    <div class="row">
        <?php
        $numRows = mysqli_num_rows($result_selected_elements);
        $zIndex = $numRows; // Initialize z-index for layering
        $zIndex = 1;

        // Initialize index for adding unique class to each image
        $imgIndex = 1;
        
        while ($selected_element = mysqli_fetch_assoc($result_selected_elements)) {
            ?>
            <div class="col-6" style="z-index: <?php echo $zIndex + 1; ?>">
                <img src="img/<?php echo $selected_element['element_img']; ?>" alt="Selected Element Image" class="img-<?php echo $imgIndex; ?>">
            </div>
            <?php
            $zIndex++; // Increase z-index for the next layer
            $imgIndex++; // Increment index for the next image
        }
        ?>
    </div>

            <script>
                // JavaScript to ensure images are loaded before manipulating layout
                window.onload = function () {
                    var images = document.querySelectorAll('.col-6 img');
                    images.forEach(function (img) {
                        img.onload = function () {
                            adjustImageLayout();
                        };
                    });
                };

                function adjustImageLayout() {
                    var maxHeight = 0;
                    var columns = document.querySelectorAll('.col-6');
                    
                    columns.forEach(function (col) {
                        var img = col.querySelector('img');
                        maxHeight = Math.max(maxHeight, img.clientHeight);
                    });

                    columns.forEach(function (col) {
                        col.style.height = maxHeight + 'px';
                    });
                }
            </script>
        </body>
        </html>
        <?php
    } else {
        echo "<p>No selected elements found.</p>";
    }
} else {
    // Redirect to the form page if the form is not submitted
    header("Location: process_order_2.php");
    exit();
}
?>
