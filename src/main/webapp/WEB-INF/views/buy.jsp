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
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Buy</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap | Ctrl+/ -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
              integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

        <!-- Monserant-Font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">

        <!-- Muli Font -->
        <link href="https://fonts.googleapis.com/css?family=Muli:600&display=swap" rel="stylesheet">

        <!-- Rokkitt Font -->
        <link href="https://fonts.googleapis.com/css?family=Rokkitt:500&display=swap" rel="stylesheet">

        <!-- AngularJS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.7.8/angular.min.js"></script>

        <!-- My CSS -->
        <link rel="stylesheet" type="text/css" href="<c:url value="/static/css/style.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="/static/css/jquery.nice-number.css"/>">

    </head>
    <body ng-app="app" ng-controller="MainCtrl" ng-cloak style="padding-top:0%">

        <!-- NAVBAR HEADER  (BUTTON TOOGLE DOESNT WORK)-->

        <nav class="navbar big-banner navbar-expand-lg navbar-light bg-white border"
             style="padding-left: 150px; padding-right: 150px; height:368px;">

            <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarMenu">
                <span class="navbar-toggler-icon"></span>
            </button>


            <div class="collapse navbar-collapse" id="#navbarMenu"
                 style="position:relative; bottom:130px; left:80px; color: blue">
                <p class="logo">C<i class="far fa-compass logopic"></i>mpass </p> 


                <ul class="navbar-nav1 ml-auto" style="display:flex; align-content:flex-start; ">
                    <li class="nav-item">
                        <a href="/Outdoor/logout" class="nav-link" style="font-size: 20px; padding-right:0px"><i class="far fa-user-circle"></i> Logout </a>
                    </li>

                </ul>
            </div>
        </nav>

        <!-- <div class="container" style="margin-left: 40px; margin-right: 40"> -->

        <!-- NAVBAR 2 -->
        <nav class="navbar navbar-expand-sm navbar-light align-center sticky-top" style="background-color: aquamarine">
            <button class="navbar-toggler" data-toggle="colapse" data-target="#navbarMenu2">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="#navbarMenu2">

                <ul class="navbar-nav mx-auto" style="text-align: center">
                    <li class="navbar-brand">
                        <a href="/Outdoor" class="navbar-brand">Home</a>
                    </li>

                    <li class="navbar-brand dropdown">
                        <a class="navbar-brand dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false">
                            Products
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="background-color: rgb(217, 223, 223)">
                            <ol class="nostyle">
                                <li ng-repeat="category in categories" class="filterItem" style="padding: none">
                                    <label class="label" for="cat{{category.categoryId}}" path="category" name="category">{{category.categoryName}}
                                        <input type="radio" id="cat{{category.categoryId}}" name="category" path="category" ng-click="brandClick(0, category.categoryId)">
                                    </label>
                                </li>
                            </ol>
                        </div>
                    </li>

                    <li class="navbar-brand dropdown">
                        <a class="navbar-brand dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false">
                            Profile
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="background-color: rgb(217, 223, 223)">
                            <a class="dropdown-item" href="/Outdoor/history">Orders History</a>
                            <a class="dropdown-item" href="/Outdoor/edit-user">Edit profile</a>

                        </div>
                    </li>
                </ul>
            </div>

        </nav>

    <body>

        <!-- BUTTON QUANTITY PLUS MINUS -->
        <!--   <div class="quantityButton" style="padding-top: 30px; outline:none">
                    Quantity
                    <input type="number" 
                           style="outline: none; padding:5px; height:25px; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,.5);
                           margin: 0 5px !important"
                           value="1">
                </div>-->
        <!-- /BUTTON QUANTITY PLUS MINUS -->


        <!-- BUTTON QUANTITY PLUS MINUS -->
        <!--<div class="quantityButton" style="padding-top: 45px">-->

        <!--</div>-->
        <div class="container" style="margin-top: 50px ; ">
            <div class="row">

                <div class="col-md-6 col-sm-6 border border-dark rounded " style="box-shadow:20px 20px 10px grey; position:relative; left:310px ">
                    <form:form id="myForm" modelAttribute="sale" method="post">

                        <form:hidden path="salesDate" id="date"/>

                        <input type="hidden" name="productId" id="prod" value="${product.productsId}"/>

                        <div class="form-group" style="text-align:center">
                            <label for="quant">Quantity</label><br>
                            <input min="1" id='quant' name="quantity" type="number" value="1"/>
                             <!--Message for availability-->
                            <div id="message" style="color:red;"></div>
                        </div>

                        <div class="form-group" style="text-align:center">
                            <form:label path="total" for="quant">Total &euro;</form:label><br>
                            <form:input  readonly="true" path="total" id="total"/>
                        </div>

                        <form:hidden id="address" path="address"/>
                        <!--<input id="post" type="submit" value="Submit" />-->
                    </form:form>

                    <div class="form-group">
                        <!-- Set up a container element for the button -->
                        <div id="paypal-button-container"></div>
                    </div>
                </div>
            </div>
        </div>



        <!--FOOTER-->
        <footer class="footer mt-5">
            <div class="container p-5">
                <!-- FIRST ROW -->
                <div class="row" style="padding-bottom: 90px; text-align: center">
                    <div class="col-md-3" style="padding-top: 30px; ">
                        <h5 class="column-title" style="padding-bottom: 30px; margin-bottom: 0%">
                            Get in touch
                        </h5>
                    </div>
                    <div class="col-md-3" style="padding-top: 30px; ">
                        <h5 class="column-title" style="padding-bottom: 30px; margin-bottom: 0%">
                            Categories
                        </h5>

                        <ul style="padding-left: 0%">
                            <li class="foo-columns" style="padding-bottom: 18px">
                                <a href="http://localhost:8080/Outdoor/cat/1" class="text-secondary ">
                                    <i class="fas fa-hiking"></i> backpacks
                                </a>
                            </li>

                            <li class="foo-columns" style="padding-bottom: 18px">
                                <a href="http://localhost:8080/Outdoor/cat/2"  class="text-secondary">
                                    <i class="fas fa-campground"></i> tents
                                </a>
                            </li>

                            <li class="foo-columns" style="padding-bottom: 18px">
                                <a href="http://localhost:8080/Outdoor/cat/3" class="text-secondary">
                                    <i class="fas fa-toolbox"></i> hiking equipment
                                </a>
                            </li>

                            <li class="foo-columns" style="padding-bottom: 18px">
                                <a href="http://localhost:8080/Outdoor/cat/4"  class="text-secondary">
                                    <i class="fas fa-medkit"></i> first-aid kits
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-3" style="padding-top: 30px; ">
                        <h5 class="column-title" style="padding-bottom: 30px ;margin-bottom: 0%">
                            Contact
                        </h5>
                        <ul style="padding-left: 0%">
                            <li class="foo-columns" style="padding-bottom: 18px">
                                <a href="#" class="text-secondary">
                                    <i class="far fa-envelope" style=></i> compass@hotmail.com
                                </a>
                            </li>

                            <li class="foo-columns" style="padding-bottom: 18px">
                                <a href="#" class="text-secondary">
                                    <i class="fas fa-phone-square"></i>

                                    (+30) 6986487890
                                </a>

                            </li>

                            <li class="foo-columns" style="padding-bottom: 18px">
                                <a href="#" class="text-secondary">
                                    <i class="fas fa-map-marker-alt"></i>location
                                </a>
                            </li>

                        </ul>
                    </div>
                    <div class="col-md-3" style="padding-top: 30px; ">
                        <h5 class="column-title" style="padding-bottom: 30px; margin-bottom: 0% ;text-align: center">
                            Newsletter
                        </h5>
                        <form>
                            <div class="email-field">
                                <input class="text-secondary"
                                       style="padding-bottom: 5px; border-style: hidden; padding-top: 0%; text-align: center"
                                       placeholder="email@example.com">
                                <hr style="margin-bottom:0% ; margin-top:15px">
                            </div>
                            <div class="subscribe">
                                <button class="subscribe-button">SUBSCRIBE</button>
                            </div>
                        </form>

                    </div>
                </div>
                <!-- SECOND ROW -->
                <div class="row">
                    <div class="paypal"
                         style="padding-left: 15px; padding-right: 15px ; text-align: center ; margin-left:190px ">
                        <a href="#">
                            <img class="h-size2" src="<c:url value='/static/pictures/paypal.png'/>"  alt="IMG-PAYPAL">
                        </a>
                        <div class="copyrights" style="padding-top: 20px; font-family: 'Montserrat', sans-serif;">
                            Copyright © 2019 All rights reserved. | This template is made with <i class="far fa-heart"></i>
                            by AFDEmp
                            Bootcamp 8
                        </div>
                    </div>
                    <!-- /second row -->
                </div>
                <!-- /container -->
            </div>

        </footer>




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


        <script>
                    var savedbid = 0;
                    var savedcid = 0;

                    const ProductApp = angular.module("app", []);

                    ProductApp.controller("MainCtrl", ['$scope', '$http', MainCtrl]);

                    function MainCtrl($scope, $http) {
                        const URL = "http://localhost:8080/Outdoor/json/${id}";
                        const brandURL = "http://localhost:8080/Outdoor/json/brands";
                        const categoryURL = "http://localhost:8080/Outdoor/json/categories";
                        $scope.products = [];
                        $scope.brands = [];
                        $scope.categories = [];
                        $http.get(URL).then(handleJson);
                        $http.get(categoryURL).then(handleJsonCategories);

                        $http.get(brandURL).then(handleJsonBrands);

                        $scope.newWelcome = function (id) {

                            location.href = "http://localhost:8080/Outdoor/cat/" + id;
                        }

                        $scope.newPage = function (id) {

                            location.href = "http://localhost:8080/Outdoor/products/" + ${id} + "/buy";
                        };

                        function handleJson(response) {
                            $scope.product = response.data;
                        }
                        function handleJsonCategories(response) {
                            $scope.categories = response.data;
                        }
                        function handleJsonBrands(response) {

                            $scope.brands = response.data;
                        }


                        $scope.brandClick = function (bid, cid) {

                            if (bid != 0 && cid == 0) {
                                savedbid = bid;
                                console.log(" IF saved BID " + savedbid);
                            } else if (bid == 0 && cid != 0) {
                                savedcid = cid;
                                console.log("IF saved CID " + savedcid);
                            }
                            let brandAndPriceByIdURL = "http://localhost:8080/Outdoor/json/" + savedbid + "/" + savedcid;
                            $http.get(brandAndPriceByIdURL).then(handleJson);
                            document.documentElement.scrollTop = 300;
                        }
                    }
        </script>

        <script type="text/javascript">
                    $(function () {

                        $('input[type="number"]').niceNumber();

                    });
        </script>
    </body>
</html>
