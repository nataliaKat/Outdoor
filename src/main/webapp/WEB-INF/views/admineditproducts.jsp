<%-- 
    Document   : admineditproducts
    Created on : 22 Ιουλ 2019, 12:30:30 πμ
    Author     : kat26
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>




<!DOCTYPE html>

<html class="no-js">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>insert</title>
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


                <ul class="navbar-nav1 ml-auto">
                    <li class="nav-item">
                        <a href="/Outdoor/logout" class="nav-link" style="font-size: 20px;"><i class="far fa-user-circle"></i> Logout</a>
                    </li>
                </ul>
            </div>
        </nav>


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
                        <a class="navbar-brand dropdown-toggle" href="#" id="navbarDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Products
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown"
                             style="background-color: rgb(217, 223, 223)">
                            <ol class="nostyle">
                                <li ng-repeat="category in categories" class="filterItem" style="padding: none">
                                    <label class="label" for="{{category.categoryId}}" path="category" name="category">{{category.categoryName}}
                                        <input type="radio" id="{{category.categoryId}}" name="category" path="category" ng-click=newWelcome(category.categoryId)>

                                    </label>
                                </li>
                            </ol>
                        </div>
                    </li>

               
                    <li class="navbar-brand">
                        <a href="/Outdoor/sales" class="navbar-brand">Sales</a>
                    </li>
                    
                    <li class="navbar-brand">
                        <a href="/Outdoor/edit-user" class="navbar-brand">Profile</a>
                    </li>
                    
                </ul>
            </div>

        </nav>

        <!-- MAIN BODY -->
        <div class="container" style="margin-top: 50px ; padding-right: 30px">
            <div class="row">
                <div class="col-md-6 col-sm-6">
                    <img class="card-img-top" style="height: 420px"
                         src="${product.imageUrl}"
                         alt="">
                    <div class="delete mt-5 border-top border-info" style=" font-family: 'Montserrat', sans-serif;  width:470px; height: 150px;">
                        <span class="light-text" style="margin-top: 20px;">Do you want to delete this product?</span>
                        <button style="position:relative; top:72px; right: 292px" onclick="window.location.href = '<c:url value="/products/delete/${product.productsId}"/>'">Delete</button>


                    </div>
                </div>

                <div class="col-md-6 col-sm-6 border border-dark rounded " style="box-shadow:20px 20px 10px grey; ">

                    <form:form method="POST" modelAttribute="product" class="main-form needs-validation" novalidate="novalidate">

                        <form:label path="productsId" type="hidden"></form:label>
                        <form:input path="productsId" type="hidden" />
                        <div class="form-group">

                            <form:label path="name">Name</form:label>
                            <form:input type="text" path="name" id="name"  maxlength="100" class="form-control" required="required"/>
                            <div class="invalid-feedback">Please enter a valid name</div>
                        </div>
                        <div class="form-group">
                            <form:label path="price">Price</form:label>
                            <form:input type="number" path="price" id="price" min="0.1" step="0.01" class="form-control" required="required"/>
                            <div class="invalid-feedback">Please enter a valid price</div>
                            <small class="form-text text-muted">
                                This should be in euros
                            </small> 
                        </div>
                        <div class="form-group">
                            <form:label path="imageUrl">Image_URL</form:label>
                            <form:input type="url" path="imageUrl" id="img_url" maxlength="200" class="form-control" required="required"/>
                            <div class="invalid-feedback">Please enter a valid url</div>
                        </div>
                        <div class="form-group">
                            <form:label path="description">Description</form:label>
                            <form:textarea type="text" path="description" id="description" maxlength="600" class="form-control" required="required"
                                           style="height:100px"/>
                            <div class="invalid-feedback">Please enter a valid text</div>

                        </div>      


                        <div class="form-group">
                            <label path="quantity">Quantity</label>
                            <input type="number" name="quantity" value="${quantity}" id="quantity" class="form-control" required="required" min="0"/>
                            <div class="invalid-feedback">Please enter a valid number</div>
                        </div>

                        <!--BRAND-->

                        <div class="form-group">
                            <!--                            <option selected="selected">3</option>                   -->
                            <label for="brand">Brand</label>    

                            <select name="brandsId" id="brand" class="form-control" value="${pBrand.brandsId}" required="required">

                                <option selected="${pBrand.brandsId}" value="${pBrand.brandsId}">${pBrand.brandname}</option>
                                <c:forEach items="${brands}" var="b"> 
                                    <c:if test="${pBrand != b}">
                                        <option value="${b.brandsId}" >${b.brandname}</option>
                                    </c:if>

                                </c:forEach>
                            </select>
                        </div>
                        <!--/BRAND-->

                        <div class="form-group">
                            <label for="category">Category</label>
<!--                            <input type="text" readonly="readonly" value="${pCategory.categoryName}"/>-->
                            <select name="categoryId" id="category" class="form-control" value="${pCategory.categoryName}" required="required">
                                <option selected="${pCategory.categoryId}" value="${pCategory.categoryId}">${pCategory.categoryName}</option>
                                <c:forEach items="${categories}" var="cat">
                                    <c:if test="${pCategory != cat}">
                                        <option value="${cat.categoryId}" >${cat.categoryName}</option>
                                    </c:if>
                                </c:forEach>     
                            </select>
                        </div>

                        <button type="submit">Update</button>


                    </div>
                </form:form>

                <hr>

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
                                                const URL = "http://localhost:8080/Outdoor/json/${id}";
                                                const brandURL = "http://localhost:8080/Outdoor/json/brands";
                                                 const categoryURL = "http://localhost:8080/Outdoor/json/categories";
                                                $scope.products = [];
                                                $scope.brands = [];
                                                 $scope.categories = [];
                                                $http.get(URL).then(handleJson);
                                                $http.get(categoryURL).then(handleJsonCategories);

                                                $http.get(brandURL).then(handleJsonBrands);
                                                
                                                $scope.newWelcome = function(id) {
                                                   
                                                    location.href ="http://localhost:8080/Outdoor/cat/" + id;
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

        <script>
                        var form = document.querySelector('.needs-validation');
                        form.addEventListener('submit', function (event) {
                            if (form.checkValidity() === false) {
                                event.preventDefault();
                                event.stopPropagation();
                            }
                            form.classList.add('was-validated');
                        })
        </script>


    </body>
</html>