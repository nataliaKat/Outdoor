<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Compass</title>
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
        <link rel="stylesheet" type="text/css" href="static/css/style.css">

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

        

        <!-- NAVBAR 2 -->
        <nav class="navbar navbar-expand-sm navbar-light align-center sticky-top" style="background-color: aquamarine">
            <button class="navbar-toggler" data-toggle="colapse" data-target="#navbarMenu2">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="#navbarMenu2">

                <ul class="navbar-nav mx-auto" style="text-align: center">
                    <li class="navbar-brand">
                        <a href="/Outdoor/products" class="navbar-brand">Home</a>
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
                                        <input type="radio" id="cat{{category.categoryId}}" name="category" path="category" ng-click=newWelcome(category.categoryId)>
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

        <!--SALES TABLE-->

        <div class="container" style="margin-top: 50px ; padding-right: 30px">
            <div class="row">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col" style="width: 20px">#</th>
                            <th scope="col" style="width: 10px">Date</th>
                            <th scope="col" style="width: 10px">Address</th>
                            <th scope="col" style="width: 100px">Product_id</th>
                            <th scope="col" style="width: 100px">Product</th>
                            <th scope="col" style="width: 100px">Total</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${history}" var="sale">
                            <tr>
                                <td>${sale.salesId}</td>
                                <td>${sale.salesDate}</td>
                                <td>${sale.address}</td>
                                <td>${sale.product.productsId}</td>
                                <td>${sale.product.name}</td>
                                <td>${sale.total}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>  

            </div>
        </div>

   

                <!--FOOTER-->
        <footer class="footer mt-5">
            <div class="container p-5">
                <!-- FIRST ROW -->
                <div class="row" style="padding-bottom: 90px; text-align: center">
                    <div class="col-md-3" style="padding-top: 30px; ">
                        <h5 class="column-title" style="padding-bottom: 30px; margin-bottom: 0%">
                           
                           Chat with us!
                        </h5>
                        <br>
                        <a href="http://ra1.anystream.eu:1090/compass-chat/"><i class="far fa-comments chat" style="font-size:70px; margin-right: 120px;"></i> </a>
                    </div>
                    <div class="col-md-3" style="padding-top: 30px; ">
                        <h5 class="column-title" style="padding-bottom: 30px; margin-bottom: 0%">
                            Categories
                        </h5>

                        <ul style="padding-left: 0%">
                               <li class="foo-columns" style="padding-bottom: 18px">
                                <a href="/Outdoor/cat/1" class="text-secondary ">
                                    <i class="fas fa-hiking"></i> backpacks
                                </a>
                            </li>
                            
                            <li class="foo-columns" style="padding-bottom: 18px">
                                <a href="/Outdoor/cat/2"  class="text-secondary">
                                    <i class="fas fa-campground"></i> tents
                                </a>
                            </li>

                            <li class="foo-columns" style="padding-bottom: 18px">
                                <a href="/Outdoor/cat/3" class="text-secondary">
                                    <i class="fas fa-toolbox"></i> hiking equipment
                                </a>
                            </li>

                            <li class="foo-columns" style="padding-bottom: 18px">
                                <a href="/Outdoor/cat/4"  class="text-secondary">
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
                <!-- Bootstrap  -->
                <script src="https://code.jquery.com/jquery-3.4.1.min.js"
                integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>

                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


                
                 <script>


                                            var savedbid = 0;
                                            var savedcid = 0;

                                            const ProductApp = angular.module("app", []);

                                            ProductApp.controller("MainCtrl", ['$scope', '$http', MainCtrl]);

                                            function MainCtrl($scope, $http) {
                                                const URL = "/Outdoor/json/${id}";
                                                const brandURL = "/Outdoor/json/brands";
                                                const categoryURL = "/Outdoor/json/categories";
                                                $scope.products = [];
                                                $scope.brands = [];
                                                $scope.categories = [];
                                                $http.get(URL).then(handleJson);
                                                $http.get(categoryURL).then(handleJsonCategories);

                                                $http.get(brandURL).then(handleJsonBrands);

                                                $scope.newWelcome = function (id) {

                                                    location.href = "/Outdoor/cat/" + id;
                                                    console.log("entered");
                                                }

                                                $scope.newPage = function (id) {

                                                    location.href = "/Outdoor/products/" + ${id} + "/buy";
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
                                                        
                                                    } else if (bid == 0 && cid != 0) {
                                                        savedcid = cid;
                                                       
                                                    }
                                                    let brandAndPriceByIdURL = "/Outdoor/json/" + savedbid + "/" + savedcid;
                                                    $http.get(brandAndPriceByIdURL).then(handleJson);
                                                    document.documentElement.scrollTop = 300;
                                                }
                                            }
        </script>
                </body>

                </html>