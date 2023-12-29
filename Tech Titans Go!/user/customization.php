<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customize my Cake</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link href="https://fonts.googleapis.com/css2?family=Lilita+One&family=Montserrat:wght@600&family=Playpen+Sans:wght@800&family=Poppins:wght@500&display=swap" rel="stylesheet">
    <style>
        body {
            background-image: url('img/background1.png');
            background-size: cover;
            font-family: 'Lilita One', sans-serif;
            min-height: 100vh; /* Set a minimum height to ensure content is visible */
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

        .btn-view-selection {
            background-color: #ADD8E6;
            padding: 15px 30px; /* Adjust the padding values to your desired size */
            font-size: 30px;   /* Adjust the font size to your desired size */
            margin-left: 100px;
            border: none;
            /* Add more styles as needed */
            }

        .btn-custom-size {
            margin-left: 100px;
            padding: 15px 30px; /* Adjust the padding values to your desired size */
            font-size: 30px;   /* Adjust the font size to your desired size */
        }
        

        @keyframes floatAnimation {
            0% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-10px); /* Adjust the distance the heading floats */
            }
            100% {
                transform: translateY(0);
            }
        }
    </style>
</head>
<a href="user_dashboard.php" class="back-btn">BACK</a>

<div class="col">
    <h1 style="font-size: 4em; text-align: center; color: #AA336A; padding: 50px; animation: floatAnimation 2s ease-in-out infinite;">CUSTOMIZE YOUR CAKE!</h1>
</div>

<div class="col">
    <?php
    session_start();
    require '../db.php';
    if (isset($_SESSION['user_id'])) 
        $uid = $_SESSION['user_id']; // user who logged in
    ?>
    
<?php
if (!isset($_GET['process_order'])) {
    // This condition will check if an order is not being processed, therefore the form will show below.
    ?>
    <form id="myForm" method="get">
        <!-- Order Form-->

        <div class="row justify-content-center">
            <div class="col-3">
                <?php
                if (isset($_SESSION['user_id'])) { ?>
                    <input type="hidden" class="form-control" name="user_id" value="<?php echo $_SESSION['user_id']; ?>">
                <?php } ?>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 col-sm-12">
            <h4 class="display-6" style="color: #8B0000;">Step 1: CHOOSE YOUR CAKE SIZE</h4>
                <div class="container-fluid">
                <div class="row">
                    <?php
                    $sql_get_element = "SELECT * FROM `elements` WHERE `step_id` = '1' AND `element_status` = 'A'";
                    $get_result = mysqli_query($conn, $sql_get_element);

                    if (mysqli_num_rows($get_result) > 0) {
                        while ($step1 = mysqli_fetch_assoc($get_result)) {
                            ?>
                            <div class="col-6">
                                <input required type="radio" class="btn-check" name="step1" value="<?php echo $step1['element_id']; ?>" id="<?php echo $step1['element_id']; ?>" autocomplete="off">
                                <label class="btn col-12 btn-outline-danger mb-1" for="<?php echo $step1['element_id']; ?>">
                                    <?php echo $step1['element_name'] . "<br>"; ?>
                                    <img class="img-fluid" src="img/<?php echo $step1['element_img'];?>" alt="">
                                    <?php echo "Php " . number_format($step1['price_amount'], 2); ?>
                                </label>
                            </div>
                            <?php
                        }
                    } else {
                        echo "<p>No available elements for this step. Currently out of stock. Please check back later.</p>";
                    }
                    ?>
                </div>
                </div>
            </div>
            <div class="col-lg-6 col-sm-12">
            <h4 class="display-6" style="color: #005000;">Step 2: CHOOSE YOUR FLAVOR</h4>
                <div class="container-fluid">
                <div class="row">
                    <?php
                    $sql_get_element_step2 = "SELECT * FROM `elements` WHERE `step_id` = '2' AND `element_status` = 'A'";
                    $get_result_step2 = mysqli_query($conn, $sql_get_element_step2);

                    if (mysqli_num_rows($get_result_step2) > 0) {
                        while ($step2 = mysqli_fetch_assoc($get_result_step2)) {
                            ?>
                            <div class="col-6">
                                <input required type="radio" class="btn-check" name="step2" value="<?php echo $step2['element_id']; ?>" id="<?php echo $step2['element_id']; ?>" autocomplete="off">
                                <label class="btn col-12 btn-outline-success mb-1" for="<?php echo $step2['element_id']; ?>">
                                    <?php echo $step2['element_name'] . "<br>"; ?>
                                    <img class="img-fluid" src="img/<?php echo $step2['element_img'];?>" alt="">
                                    <?php echo "Php " . number_format($step2['price_amount'], 2); ?>
                                </label>
                            </div>
                            <?php
                        }
                    } else {
                        echo "<p>No available elements for this step. Currently out of stock. Please check back later.</p>";
                    }
                    ?>
                </div>
                </div>
            </div>
            <div class="col-lg-6 col-sm-12">
                <h4 class="display-6" style="color: #BE5504;">Step 3: CHOOSE YOUR COLOR</h4>
                <div class="container-fluid">
                <div class="row">
                    <?php
                    $sql_get_element_step3 = "SELECT * FROM `elements` WHERE `step_id` = '3' AND `element_status` = 'A'";
                    $get_result_step3 = mysqli_query($conn, $sql_get_element_step3);

                    if (mysqli_num_rows($get_result_step3) > 0) {
                        while ($step3 = mysqli_fetch_assoc($get_result_step3)) {
                            ?>
                            <div class="col-6">
                            <input required type="radio" class="btn-check" name="step3" value="<?php echo $step3['element_id']; ?>" id="<?php echo $step3['element_id']; ?>" autocomplete="off">
                            <label class="btn col-12 btn-outline-warning mb-1" for="<?php echo $step3['element_id']; ?>">
                                <?php echo $step3['element_name'] . "<br>"; ?>
                                <img class="img-fluid" src="img/<?php echo $step3['element_img'];?>" alt="">
                                <?php echo "Php " . number_format($step3['price_amount'], 2); ?>
                            </label>
                        </div>
                        <?php
                    }
                } else {
                    echo "<p>No available elements for this step. Currently out of stock. Please check back later.</p>";
                }
                ?>
                </div>
                </div>
            </div>
            <div class="col-lg-6 col-sm-12">
                <h4 class="display-6" style="color: #0A2472;">Step 4: CHOOSE YOUR DESIGN</h4>
                <div class="row">
                    <?php
                    $sql_get_element_step4 = "SELECT * FROM `elements` WHERE `step_id` = '4' AND `element_status` = 'A'";
                    $get_result_step4 = mysqli_query($conn, $sql_get_element_step4);

                    if (mysqli_num_rows($get_result_step4) > 0) {
                        while ($step4 = mysqli_fetch_assoc($get_result_step4)) {
                            ?>
                            <div class="col-6">
                                <input required type="radio" class="btn-check" name="step4" value="<?php echo $step4['element_id']; ?>" id="<?php echo $step4['element_id']; ?>" autocomplete="off">
                                <label class="btn col-12 btn-outline-primary mb-1" for="<?php echo $step4['element_id']; ?>">
                                    <?php echo $step4['element_name'] . "<br>"; ?>
                                    <img class="img-fluid" src="img/<?php echo $step4['element_img'];?>" alt="">
                                    <?php echo "Php " . number_format($step4['price_amount'], 2); ?>
                                </label>
                            </div>
                            <?php
                        }
                    } else {
                        echo "<p>No available elements for this step. Currently out of stock. Please check back later.</p>";
                    }
                    ?>
                </div>
                </div>
            </div>
            <div class="col-lg-6 col-sm-12">
                <h4 class="display-6" style="color: #0A2472;">Step 5. CHOOSE YOUR TOPPING</h4>
                <div class="container-fluid">
                <div class="row">
                    <?php
                    $sql_get_element_step5 = "SELECT * FROM `elements` WHERE `step_id` = '5' AND `element_status` = 'A'";
                    $get_result_step5 = mysqli_query($conn, $sql_get_element_step5);

                    if (mysqli_num_rows($get_result_step5) > 0) {
                        while ($step5 = mysqli_fetch_assoc($get_result_step5)) {
                        ?>
                        <div class="col-6">
                            <input required type="radio" class="btn-check" name="step5" value="<?php echo $step5['element_id']; ?>" id="<?php echo $step5['element_id']; ?>" autocomplete="off">
                            <label class="btn col-12 btn-outline-primary mb-1" for="<?php echo $step5['element_id']; ?>">
                                <?php echo $step5['element_name'] . "<br>"; ?>
                                <img class="img-fluid" src="img/<?php echo $step5['element_img'];?>" alt="">
                                <?php echo "Php " . number_format($step5['price_amount'], 2); ?>
                            </label>
                        </div>
                        <?php
                    }
                } else {
                    echo "<p>No available elements for this step. Currently out of stock. Please check back later.</p>";
                }
                ?>
                </div>
                </div>
            </div>
        </div>
        <!-- Order Form-->
        <div class="row">
        <div class="col-9"></div>
        <div class="col-3">
            <input type="submit" name="process_order" class="btn btn-view-selection btn-warning mb-2" value="VIEW DESIGN" onclick="setAction('display_selection.php')">
            <input type="button" name="process_order" class="btn btn-custom-size btn-warning mb-3" value="BAKE IT NOW" onclick="confirmBeforeBake()">
        </div>
    </div>
</form>

<script>
    // Check if local storage is supported by the browser
    if (typeof(Storage) !== "undefined") {
        // Load saved selections when the page is loaded
        window.onload = function () {
            loadSelections();
            checkAvailability(); // Check availability on page load
        };

        // Save selections when a radio button is clicked
        document.addEventListener('change', function (event) {
            if (event.target.type === 'radio') {
                saveSelection(event.target.name, event.target.value);
                checkAvailability(); // Check availability when a radio button changes
            }
        });

        // Function to save selections to local storage
        function saveSelection(step, value) {
            // Include user ID in the storage key
            var userId = <?php echo isset($uid) ? json_encode($uid) : "null"; ?>;
            if (userId) {
                localStorage.setItem(userId + '-' + step, value);
            }
        }

        // Function to load selections from local storage
        function loadSelections() {
            var userId = <?php echo isset($uid) ? json_encode($uid) : "null"; ?>;
            if (userId) {
                var elements = document.querySelectorAll('input[type=radio]');
                elements.forEach(function (element) {
                    var savedValue = localStorage.getItem(userId + '-' + element.name);
                    if (savedValue === element.value) {
                        element.checked = true;
                    }
                });
            }
        }

        // Function to check availability and enable/disable buttons
        function checkAvailability() {
            var steps = [1, 2, 3, 4, 5]; // Add all step numbers
            var isAvailable = true;

            steps.forEach(function (step) {
                var radioButtons = document.querySelectorAll('input[name="step' + step + '"]');
                var isChecked = Array.from(radioButtons).some(function (radio) {
                    return radio.checked;
                });

                if (!isChecked) {
                    isAvailable = false;
                }
            });

            // Enable/disable buttons based on availability
            document.querySelector('.btn-view-selection').disabled = !isAvailable;
            document.querySelector('.btn-custom-size').disabled = !isAvailable;
        }
    } else {
        // Local storage not supported
        console.log('Local storage is not supported by your browser.');
    }

    function setAction(action) {
        document.getElementById('myForm').action = action;
    }

    function confirmBeforeBake() {
        var confirmation = confirm("Are you sure you want to proceed and bake the cake? Double-check your design!");
        if (confirmation) {
            setAction('process_order_2.php');
            document.getElementById('myForm').submit(); // Submit the form if the user confirms
        }
    }
</script>


<?php
}
?>


<script src="../js/bootstrap.js"></script>

</body>
</html>