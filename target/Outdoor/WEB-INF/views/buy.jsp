<%-- 
    Document   : buy
    Created on : 28 Ιουλ 2019, 9:50:03 μμ
    Author     : kat26
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1253">
        <title></title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap | Ctrl+/ -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
              integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">


        <!-- My CSS -->
        <link rel="stylesheet" type="text/css" href="../static/css/style.css">
        <link rel="stylesheet" type="text/css" href="../static/css/jquery.nice-number.css">

    </head>
    <body>
        <!-- BUTTON QUANTITY PLUS MINUS -->
        <div class="quantityButton" style="padding-top: 45px">
            Quantity
            <input type="number" id="quant"
                   style="outline: none; padding:5px; border-radius: 5px; box-shadow: 0 2px 5px rgba(0,0,0,.5); margin: 0 5px !important" value="1">
        </div>
        <!--Message for availability-->
        <div id="message" style="color:red;"></div>

        <!-- Set up a container element for the button -->
        
        <div id="paypal-button-container"></div>










        <script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- Include the PayPal JavaScript SDK -->
        <script src="https://www.paypal.com/sdk/js?client-id=sb&currency=USD"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>



        <!-- BUTTON QUANTITY -->
        <script src="static/js/jquery.nice-number.js"></script>


        <script>
            // Render the PayPal button into #paypal-button-container            
            jQuery(document).ready(init);

            function init($) {

                $("#quant").on("keyup", handleKeyUp);
                function handleKeyUp(event) {
                    let usersQuantity = $("#quant").val();
                    if (usersQuantity > ${quantity}) {
                        $("#message").html("Quantity not available.");
                    } else {
                        $("#message").html("");

                    }
                }

                paypal.Buttons({

                    // Set up the transaction
                    createOrder: function (data, actions) {
                        return actions.order.create({
                            purchase_units: [{
                                    amount: {
                                        value: ${product.price} * $("#quant").val()
                                    }
                                }]
                        });
                    },

                    // Finalize the transaction
                    onApprove: function (data, actions) {
                        return actions.order.capture().then(function (details) {
                            // Show a success message to the buyer
                            alert('Transaction completed by ' + details.payer.name.given_name + '!');
                               
                            });
                    }


                }).render('#paypal-button-container');

            }

        </script>

    </body>
</html>
