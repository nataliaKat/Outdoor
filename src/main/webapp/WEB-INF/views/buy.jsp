<%-- 
    Document   : buy
    Created on : 28 Ιουλ 2019, 9:50:03 μμ
    Author     : kat26
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

        </div>

        <form:form id="myForm" modelAttribute="sale" method="post">

            <form:hidden path="salesDate" id="date"/>

            <input type="hidden" name="productId" id="prod" value="${product.productsId}"/>
            <input min="1" id='quant' name="quantity" type="number" value="1"/>
            <form:label path="total" for="quant">Total</form:label>
            <form:input  readonly="true" path="total" id="total"
                         style="outline: none; padding:5px; border-radius: 5px; box-shadow: 0 2px 5px rgba(0,0,0,.5); margin: 0 5px !important"/>
            <form:hidden id="address" path="address"/>
            <!--<input id="post" type="submit" value="Submit" />-->
            </form:form>



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

                $("#quant").on("keyup click", handleKeyUp);
                function handleKeyUp(event) {
                    let usersQuantity = $("#quant").val();
                    if (usersQuantity > ${quantity}) {
                        $("#message").html("Quantity not available.");
                        $("#total").val("");
                        console.log($("#total").val());
                    } else if (usersQuantity < 0) {
                        $("#quant").val(1);
                        $("#total").val(${product.price} * $("#quant").val());
                        console.log($("#total").val());
                    } else {
                        $("#message").html("");
                        $("#total").val(${product.price} * $("#quant").val());
                        console.log($("#total").val());



                    }
                }
                var today = new Date();
                var month = today.getMonth() + 1;
                $("#date").val(today.getFullYear() + "/" + month + "/" + today.getDate());
                $("#total").val(${product.price} * $("#quant").val());

                paypal.Buttons({

 
                    // Set up the transaction
                    createOrder: function (data, actions) {
                        return actions.order.create({
                            purchase_units: [{
                                    amount: {
                                        value: $("#total").val()
                                    }
                                }]
                        });
                    },

                    // Finalize the transaction
                    onApprove: function (data, actions) {
                        return actions.order.capture().then(function (details) {
                            // Show a success message to the buyer
                            alert('Transaction completed by ' + details.payer.name.given_name + '!');
                            console.log(details);
//                            console.log(details.purchase_units[0].shipping.address.address_line_1 + ", " + details.purchase_units[0].shipping.address.postal_code);
                            $('#address').val(details.purchase_units[0].shipping.address.address_line_1 + ", " + details.purchase_units[0].shipping.address.postal_code);

                            document.querySelector("#myForm").submit();




                        });
                    }




                }).render('#paypal-button-container');



            }



        </script>
    </body>
</html>
