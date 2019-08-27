

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html class="no-js">

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
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.css">  


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
                <p class="logo">C<i class="far fa-compass logopic"></i>mpass </p> 


                <ul class="navbar-nav1 ml-auto" style="display:flex; align-content:flex-start; ">
                    <li class="nav-item">
                        <a href="/Outdoor/login" class="nav-link" style="font-size: 20px; padding-right:0px"><i class="far fa-user-circle"></i> Login </a>
                    </li>
                    <li class="nav-item">
                        <p class="nav-link" style="font-size: 20px; padding-left:10px; padding-right:10px">|</p>  
                    </li>
                    <li class="nav-item">
                        <a href="/Outdoor/newuser" class="nav-link" style="font-size: 20px; padding-left:0px"><i class="fas fa-sign-in-alt"></i> Register</a>
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

        <!-- MAIN BODY -->
        <div class="container" style="margin-top: 50px">
            <div class="row">
                <div class="filter col-lg-3 border"  >

                    <div class="brand">
                        <h4> Brands</h4><hr>
                        <ol class="nostyle">

                            <li ng-repeat="brand in brands" class="filterItem" >
                                <label class="label" for="{{brand.brandsId}}" path="brand" name="brand">{{brand.brandname}}
                                    <input type="radio" id="{{brand.brandsId}}" name="brand" path="brand" ng-click="brandClick(brand.brandsId, 0)">
                                    <span class="checkmark"></span>
                                </label>
                            </li>
                        </ol>
                    </div>

                    <div class="category">
                        <h4>Categories</h4><hr>
                        <ol class="nostyle">
                            <li ng-repeat="category in categories" class="filterItem">
                                <label class="label" for="category{{category.categoryId}}" path="category" name="category">{{category.categoryName}}
                                    <input type="radio" id="category{{category.categoryId}}" name="category" path="category" ng-click="brandClick(0, category.categoryId)">
                                    <span class="checkmark"></span>
                                </label>
                            </li>
                        </ol>
                    </div>

                    <div class="price">
                        <h4>Price</h4><hr>
                        <!--VALUE POINTERS-->

                        <div class="valuePointers">
                            <div class="box">
                                <center>
                                    <div id="value"></div>
                                </center>
                            </div>
                            <div> <h3>-</h3></div>
                            <div class="box2">
                                <center>
                                    <div id="value2"></div>
                                </center>
                            </div>
                        </div>


                        <!--RANGE BARS-->
                        <div class="rangeContainer">
                            <div class="col1" >
                                Min &euro; <input type="range" min="${minimumPrice}" max="${maximumPrice/2}" value="${minimumPrice}" class="slider" id="slider" ng-model="price_slider.start[0]" ng-click="priceFiltering('filter')" value="Filter">
                            </div>
                            <br>
                            <div class="col1">
                                Max &euro; <input type="range" min="${maximumPrice/2}" max="${maximumPrice}" value="${maximumPrice}" class="slider" id="slider2" ng-model="price_slider.start[1]" ng-click="priceFiltering('filter')" value="Filter">
                            </div> 
                            <br>
                               </div>
                    </div>
                    <br>
                    <a href="/Outdoor"><span><h5> Clear all filters</h5></span> </a>

                </div>

                <div class="col-lg-9">
                    <div class="row">




                        <!-- ITEM 1 -->

                        <div class="col-lg-4 col-md-6 mb-4"  ng-model="show" ng-repeat="product in products| filter:pricefilter">

                            <div class="card h-100 border" > 
                                <a href="#"><img class="card-img-top" ng-src="{{ product.imageUrl}}" alt=""></a>
                                <div class="card-body" >{{product.brand.brandname}}
                                    <h4 class="card-title" style="font-family: 'Muli', sans-serif; overflow: hidden; height: 60px">
                                        <a href="#">{{ product.name}}</a>
                                    </h4>
                                    <h5 style="font-family: 'Rokkitt', serif;">&euro;{{ product.price}} </h5>
                                    <hr style="margin-top:5px; margin-bottom:7px">
                                    <p class="card-text text-left" style="height:100px; overflow:auto"> {{ product.description}} 

                                    </p>

                                </div>
                                <!-- SEE MORE -->
                                <div class="purchase" style="text-align: center">
                                    <button id="edit" class="btn-block btn-lg" style="padding-left:0%; padding-right:0%; 
                                            margin-left:0%" value="" ng-click="newPage(product.productsId)">See More</button>

                                </div>
                                <!-- /SEE MORE -->

                                <div class="card-footer">
                                    <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                                </div>

                            </div>
                        </div>
                        <!--ITEM 1-->

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
                        <h5 class="column-title " style="padding-bottom: 30px; margin-bottom: 0%">
                            Chat with us!
                        </h5>
                        <br>
                        <a href="#" class="add"><i class="far fa-comments " style="font-size:70px; margin-right: 120px;"></i> </a>
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
                                <a href="" class="text-secondary">
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
            <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <script>
                                                        var savedbid = 0;
                                                        var savedcid = 0;
                                                        const ProductApp = angular.module("app", []);
                                                        ProductApp.controller("MainCtrl", ['$scope', '$http', MainCtrl]);

                                                        function MainCtrl($scope, $http) {
                                                            const URL = "/Outdoor/json/0/" +${catcat};
                                                            const brandURL = "/Outdoor/json/brands/";
                                                            const categoryURL = "/Outdoor/json/categories";
                                                            $scope.products = [];
                                                            $scope.brands = [];
                                                            $scope.categories = [];

                                                            $http.get(URL).then(handleJson);
                                                            $http.get(brandURL).then(handleJsonBrands);
                                                            $http.get(categoryURL).then(handleJsonCategories);

                                                            function handleJsonCategories(response) {
                                                                $scope.categories = response.data;
                                                            }

                                                            function handleJson(response) {
                                                                $scope.products = response.data;
                                                            }

                                                            function handleJsonBrands(response) {
                                                                $scope.brands = response.data;
                                                            }
                                                            function handleJsonPrice(response) {
                                                                $scope.prices = response.data;
                                                            }
                                                            $scope.newPage = function (id) {

                                                                location.href = "/Outdoor/products/" + id;
                                                            };


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



//                    PRICE FILTER
                                                            $scope.priceFiltering = function () {
                                                                $scope.minPrice = $scope.price_slider.start[0];
                                                                $scope.maxPrice = $scope.price_slider.start[1];

                                                                $scope.pricefilter = function (product) {
                                                                    if ((product.price <= $scope.maxPrice) && (product.price >= $scope.minPrice)) {
                                                                        return product;
                                                                    }
                                                                };
                                                            }

                                                            $scope.price_slider = {
                                                                start: [${minimumPrice}, ${maximumPrice}],
                                                                connect: true,
                                                                step: 1,
                                                                range: {
                                                                    min: ${minimumPrice},
                                                                    max: ${maximumPrice}
                                                                }
                                                            };
                                                            //MAIN
                                                        }
                                                        
                                                        
                                                        
                                                        $(document).ready(function () {
                                                            $(".add").click(function () {
                                                                toastr.info("You have to login first");
                                                            });
                                                            $
                                                        });



        </script>


        <script type="text/javascript">
                    var slider = document.getElementById("slider");
                    var val = document.getElementById("value");
                    val.innerHTML = slider.value;
                    slider.oninput = function () {
                        val.innerHTML = this.value;
                    }

                    var slider2 = document.getElementById("slider2");
                    var val2 = document.getElementById("value2");
                    val2.innerHTML = slider2.value;
                    slider2.oninput = function () {
                        val2.innerHTML = this.value;
                    }

        </script>

    </body>

</html>
