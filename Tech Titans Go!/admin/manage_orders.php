<?php
include_once("../db.php"); 

function get_total_sales_custom_order($conn){
    $sql_get_sales = "SELECT SUM(order_amount) AS total_sales
                      FROM `orders`
                      WHERE order_status = 'D'";
    
    $sales_result = mysqli_query($conn, $sql_get_sales);
    $row = mysqli_fetch_array($sales_result);

    return "Php ".number_format($row['total_sales'], 2);
}
?>

<html>
<head>
    <meta charset="UTF-16">
    <title>Manage Orders</title>
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

        .total-sales-container {
            margin-top: 0px;
            background-color: #f0f0f0;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
        }

        .total-sales-label {
            font-size: 2em;
            color: black;
            margin-right: 5px;
        }

        .total-sales {
            font-weight: bold;
            color: #AA336A;
            font-size: 2em;
        }
    </style>
</head>
<body id="home-page">
    <a href="admin_dashboard.php" class="back-btn">BACK</a>
    <header>
        <p>MANAGE ORDERS</p>
    </header>

    <div class="container-fluid total-sales-container">
    <p><span class="total-sales-label">Total Sales:</span> <span class="total-sales"><?php echo get_total_sales_custom_order($conn); ?></span></p>
    </div>
    
    <div class="container-fluid">
        <div class="row">
            </div>
        </div>
        <div class="row">
            <div class="col-1"></div>
            <div class="col-11 pt-5">
                <br><br>
                     <?php
                        if(isset($_GET['msg'])){
                            switch($_GET['msg']){
                                case 'y': echo "<span class='alert alert-success'>Update Successful</span>";
                                    break;
                                case 'n': echo "<span class='alert alert-danger'>Update was not successful.</span>";
                                    break;
                                default:
                            }
                        }
                    ?>
                      <div class="container-fluid">
                          <div class="row">
                              <div class="col-4">
                                  <h3>Pending</h3>
                                   <?php
                                     $sql_get_reference = "SELECT DISTINCT o.order_id
                                                                         , u.user_fullname
                                                                         , u.address
                                                                      from `orders` o
                                                                      join `users` u
                                                                        on o.user_id = u.user_id
                                                                     where o.order_status = 'P' ";
                                     $reference_result = mysqli_query($conn, $sql_get_reference);
                                     
                                     while($row = mysqli_fetch_assoc($reference_result)){ //loop for the reference number
                                         
                                         $ord_id = $row['order_id'];
                                         $user = $row['user_fullname'];
                                         $address = $row['address'];
                                         
                                         echo "<em>".$ord_id."</em> - <a>".$user."</a> <br>" ;
                                         echo "<small>".$address."</small>" ;
                                         $sql_get_element = "SELECT e.element_name
                                                                     , e.price_amount
                                                                     , e.element_img
                                                                  from `orders` o
                                                                  JOIN `elements` e
                                                                    ON o.element_id = e.element_id
                                                                 where o.order_id = '$ord_id'";
                                         $element_result = mysqli_query($conn,$sql_get_element);
                                         
                                         echo "<ul>";
                                         while($ele = mysqli_fetch_assoc($element_result)){
                                             echo "<li>" . $ele['element_name'] . "(". $ele['price_amount'] .")" . "</li>";
                                         }
                                         echo "</ul>";  ?>
                                     <a href="javascript:void(0);" onclick="confirmAction('Delivered', '<?php echo $ord_id; ?>');" class="btn btn-success btn-sm">Delivered</a>
                                     <a href="javascript:void(0);" onclick="confirmAction('Cancel', '<?php echo $ord_id; ?>');" class="btn btn-danger btn-sm">Cancel</a> <hr>
                                     <?php } //end loop for the reference number
                                     ?>
                
                              </div>
                              <div class="col-4">
                                <h3>Delivered</h3>
                                 <?php
                                    $sql_get_reference = "SELECT DISTINCT `order_id`, u.user_fullname, u.address
                                                          FROM `orders` o
                                                          JOIN `users` u ON o.user_id = u.user_id
                                                          WHERE o.order_status = 'D'";
                                    $reference_result = mysqli_query($conn, $sql_get_reference);

                                    while ($row = mysqli_fetch_assoc($reference_result)) { //loop for the reference number
                                        $ord_id = $row['order_id'];
                                        $user = $row['user_fullname'];
                                        $address = $row['address'];

                                        echo "<em>" . $ord_id . "</em> - <a>" . $user . "</a> <br>";
                                        echo "<small>" . $address . "</small>";

                                        $sql_get_element = "SELECT e.element_name, e.price_amount, e.element_img
                                                            FROM `orders` o
                                                            JOIN `elements` e ON o.element_id = e.element_id
                                                            WHERE o.order_id = '$ord_id'";
                                        $element_result = mysqli_query($conn, $sql_get_element);

                                        echo "<ul>";
                                        while ($ele = mysqli_fetch_assoc($element_result)) {
                                            echo "<li>" . $ele['element_name'] . "(" . $ele['price_amount'] . ")" . "</li>";
                                        }
                                        echo "</ul>";
                                        } //end loop for the reference number
                                ?>
                              </div>

                              <div class="col-4">
                                <h3>Cancelled</h3>
                                <?php
                                  $sql_get_reference = "SELECT DISTINCT `order_id`, u.user_fullname, u.address
                                                        FROM `orders` o
                                                        JOIN `users` u ON o.user_id = u.user_id
                                                        WHERE o.order_status = 'C'";
                                  $reference_result = mysqli_query($conn, $sql_get_reference);

                                  while ($row = mysqli_fetch_assoc($reference_result)) { //loop for the reference number
                                    $ord_id = $row['order_id'];
                                    $user = $row['user_fullname'];
                                    $address = $row['address'];

                                    echo "<em>" . $ord_id . "</em> - <a>" . $user . "</a> <br>";
                                    echo "<small>" . $address . "</small>";

                                    $sql_get_element = "SELECT e.element_name, e.price_amount, e.element_img
                                                        FROM `orders` o
                                                        JOIN `elements` e ON o.element_id = e.element_id
                                                        WHERE o.order_id = '$ord_id'";
                                    $element_result = mysqli_query($conn, $sql_get_element);

                                    echo "<ul>";
                                  while ($ele = mysqli_fetch_assoc($element_result)) {
                                        echo "<li>" . $ele['element_name'] . "(" . $ele['price_amount'] . ")" . "</li>";
                                  }
                                  echo "</ul>";
                                  } //end loop for the reference number
                                ?>
                                </div>  
                              </div>
                          </div>
                      </div>
                      
               
            </div>
            <div class="col-1"></div>
        </div>
    </div>


    <script src="../js/bootstrap.js"></script>
    <!-- Add this script inside the head tag -->
    <script>
        function confirmAction(action, orderId) {
            var confirmation = confirm("Are you sure you want to " + action + " this order?");
            if (confirmation) {
                window.location.href = "update_order_status.php?update_order_status=" + action + "&order_id=" + orderId;
            }
        }
    </script>

</body>
</html>