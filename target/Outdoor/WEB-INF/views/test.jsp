<%-- 
    Document   : test
    Created on : 25 Ιουλ 2019, 8:06:27 μμ
    Author     : kat26
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html class="no-js">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>shop-admin</title>
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
        <link rel="stylesheet" type="text/css" href="<c:url value='/static/css/style.css'/>"
    </head>




    <body ng-app="app" ng-controller="MainCtrl" ng-cloak style="padding-top: 0px">

        <!-- NAVBAR HEADER  (BUTTON TOOGLE DOESNT WORK)-->

        <nav class="navbar big-banner navbar-expand-lg navbar-light bg-white border"
             style="padding-left: 150px; padding-right: 150px; height:368px;">

            <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarMenu">
                <span class="navbar-toggler-icon"></span>
            </button>


            <div class="collapse navbar-collapse" id="#navbarMenu"
                 style="position:relative; bottom:130px; left:80px; color: blue">
                <!-- <p class="text-center font-italic font-weight-bold" style="">Compass</p> -->


                <ul class="navbar-nav1 ml-auto" style="display:flex; align-content:flex-start; ">
                    <li class="nav-item">
                        <a href="/Outdoor/logout" class="nav-link" style="font-size: 20px; padding-right:0px"><i class="far fa-user-circle"></i> Logout </a>
                    </li>
                    <li class="nav-item">
                        <p class="nav-link" style="font-size: 20px; padding-left:10px; padding-right:10px">|</p>  
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link" style="font-size: 20px; padding-left:0px"><i class="fas fa-sign-in-alt"></i> Register</a>
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
                        <a href="#" class="navbar-brand">Home</a>
                    </li>

                    <li class="navbar-brand dropdown">
                        <a class="navbar-brand dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false">
                            Products
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="background-color: rgb(217, 223, 223)">
                            <a class="dropdown-item" href="#">Tents</a>
                            <a class="dropdown-item" href="#">Hiking Equipment</a>
                            <a class="dropdown-item" href="#">Backpacks</a>
                            <a class="dropdown-item" href="#">First Aid Kits</a>
                        </div>
                    </li>

                    <li class="navbar-brand">
                        <a href="#" class="navbar-brand">Brands</a>
                    </li>
                    <li class="navbar-brand">
                        <a href="#" class="navbar-brand">Sales</a>
                    </li>
                </ul>
            </div>

        </nav>

        <!-- MAIN BODY -->
        <div class="container" style="margin-top: 50px">
            <div class="row">
                <div class="filter col-lg-3 border" style="text-align: center">
                    
                      <button id="new" class="btn-block btn-lg" style="padding-left:0%; padding-right:0%; 
                                            margin-left:0%" value="" ng-click="insertProduct()">Add</button>
                    FILTER SECTION
                    <hr><br>

                    <!--                    Price <br><hr>
                    
                                        Up to 50 Euro<input type="checkbox" id="low"  ng-model="show" onclick="lowPrice()"><br>
                                        Up to 200 Euro<input type="checkbox" id="medium"><br>
                                        Up to<input type="checkbox" id="high"> 
                    -->

                    <!--Brands<hr>-->
                    <!--<ol>-->
                    <!--    <li ng-repeat="brand in brands ">
                            <label for="{{brand.brandname}}">{{brand.brandname}}</label>
                            <input type="checkbox" id="{{brand.brandname}}" ng-model="show">
                        </li>-->
                    <!--</ol>-->
                </div>

                <div class="col-lg-9">
                    <div class="row">




                        <!-- ITEM 1 -->

                        <div class="col-lg-4 col-md-6 mb-4"  ng-model="show" ng-repeat="product in products">

                            <div class="card h-100 border" > 
                                <a href="#"><img class="card-img-top" src="{{ product.imageUrl}}" alt=""></a>
                                <div class="card-body" >{{product.brand.brandname}}
                                    <h4 class="card-title" style="font-family: 'Muli', sans-serif; overflow: hidden; height: 60px">
                                        <a href="#">{{ product.name}}</a>
                                    </h4>
                                    <h5 style="font-family: 'Rokkitt', serif;">&euro;{{ product.price}} </h5>
                                    <hr style="margin-top:5px; margin-bottom:7px">
                                    <p class="card-text text-left" style="height:100px; overflow:auto"> {{ product.description}} 

                                    </p>

                                </div>
                                <!-- EDIT -->
                                <div class="purchase" style="text-align: center">
                                    <button id="edit" class="btn-block btn-lg" style="padding-left:0%; padding-right:0%; 
                                            margin-left:0%" value="" ng-click="newPage(product.productsId)">Edit</button>

                                </div>
                                <!-- /EDIT -->

                                <div class="card-footer">
                                    <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                                </div>

                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>


        <!-- FOOTER -->

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
                                <a href="#" class="text-secondary">
                                    <i class="fas fa-campground"></i> tents
                                </a>
                            </li>

                            <li class="foo-columns" style="padding-bottom: 18px">
                                <a href="#" class="text-secondary">
                                    <i class="fas fa-toolbox"></i> hiking equipment
                                </a>
                            </li>

                            <li class="foo-columns" style="padding-bottom: 18px">
                                <a href="#" class="text-secondary ">
                                    <i class="fas fa-hiking"></i> backpacks
                                </a>
                            </li>

                            <li class="foo-columns" style="padding-bottom: 18px">
                                <a href="#" class="text-secondary">
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
                    <div class="paypal" style="padding-left: 15px; padding-right: 15px ; text-align: center ; margin-left:190px ">
                        <a href="#">
                            <img class="h-size2" src="static/pictures/paypal.png" alt="IMG-PAYPAL">
                        </a>
                        <div class="copyrights" style="padding-top: 20px; font-family: 'Montserrat', sans-serif;">
                            Copyright © 2019 All rights reserved. | This template is made with <i class="far fa-heart"></i> by AFDEmp
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

                                                      const ProductApp = angular.module("app", []);

                                                      ProductApp.controller("MainCtrl", ['$scope', '$http', MainCtrl]);

                                                      function MainCtrl($scope, $http) {
                                                          const URL = "http://localhost:8080/Outdoor/json";
                                                          $scope.products = [];
                                                          $http.get(URL).then(handleJson);


                                                          function handleJson(response) {

                                                              $scope.products = response.data;
                                                          }
                                                          $scope.newPage = function(id) {
                                                          
                                                              location.href = "http://localhost:8080/Outdoor/products/" + id;
                                                          };
                                                          $scope.insertProduct = function() {
                                                              location.href = "http://localhost:8080/Outdoor/products/new"
                                                          }
                                                      }






        </script>

        <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
              integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
              crossorigin="anonymous"></script>
      
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
              integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
              crossorigin="anonymous"></script> 
              
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
              integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
              crossorigin="anonymous"></script>  -->

    </body>

</html>
