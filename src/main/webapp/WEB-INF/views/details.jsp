<%-- 
    Document   : details
    Created on : 28 Ιουλ 2019, 7:44:35 μμ
    Author     : kat26
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

  <!-- AngularJS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.7.8/angular.min.js"></script>
  
  <!-- My CSS -->
  <link rel="stylesheet" type="text/css" href="static/css/style.css">
  <link rel="stylesheet" type="text/css" href="static/css/jquery.nice-number.css">
    </head>
<body ng-app="app" ng-controller="MainCtrl" ng-cloak style="padding-top:0%">

  <!-- NAVBAR HEADER  (BUTTON TOOGLE DOESNT WORK)-->

  <nav class="navbar navbar-expand-lg navbar-light bg-white border" style="padding-left: 150px; padding-right: 150px">

    <img
      src="https://cdn2.shopify.com/s/files/1/0173/2227/8976/products/mountain-compass-temporary-tattoos-easytatt-6802109694016_2048x2048.jpg?v=1548635909"
      width="150" height="120" class="d-inline-block align-center " alt="">
    <a class="navbar-brand" href="#">
      <h2 class="text-center font font-weight-bold" style="padding-left: 20px">Compass</h2>
    </a>


    <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarMenu">
      <span class="navbar-toggler-icon"></span>
    </button>


    <div class="collapse navbar-collapse" id="#navbarMenu">
      <!-- <p class="text-center font-italic font-weight-bold" style="">Compass</p> -->
      <ul class="navbar-nav ml-auto">
        <form class="form-inline" style="padding-right: 65px;">
          <input class="form-control mr-auto" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>

        <li class="nav-item">
          <a href="#" class="nav-link">Logout</a>
        </li>
      </ul>
    </div>
  </nav>

  <!-- <div class="container" style="margin-left: 40px; margin-right: 40"> -->

  <!-- NAVBAR 2(BUTTON TOOGLE DOESNT WORK) -->
  <nav class="navbar navbar-expand-sm navbar-light align-center" style="background-color: aquamarine">
    <button class="navbar-toggler" data-toggle="colapse" data-target="#navbarMenu2">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="#navbarMenu2">

      <ul class="navbar-nav mx-auto" style="padding-left: 50px; padding-right:50px">
        <li class="navbar-brand">
          <a href="#" class="navbar-brand">Home</a>
        </li>

        <li class="navbar-brand dropdown">
          <a class="navbar-brand dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
            aria-haspopup="true" aria-expanded="false">
            Products
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="#">Tents</a>
            <a class="dropdown-item" href="#">Hiking Equipment</a>
            <a class="dropdown-item" href="#">Backpacks</a>
            <a class="dropdown-item" href="#">First Aid Kits</a>
          </div>
        </li>

        <li class="navbar-brand">
          <a href="#" class="navbar-brand">About</a>
        </li>
        <li class="navbar-brand">
          <a href="#" class="navbar-brand">Contact</a>
        </li>
      </ul>
    </div>

  </nav>

  <!-- MAIN BODY -->
  <div class="container" style="margin-top: 50px ; padding-right: 30px">
    <div class="row">
      <div class="col-md-6 col-sm-6">
        <img class="card-img-top"
          src="{{product.imageUrl}}"
          alt="">
      </div>

      <div class="col-md-6 col-sm-6">
          <div class="info" >
          <h2 class="product-name m-text16">{{product.name}}</h2>
          <p style="padding-bottom: 25px"><span>Code: {{product.productsId}}</span></p>
          
          <span class="m-text17">&euro;{{product.price}}</span>
          <!-- BUTTON QUANTITY PLUS MINUS -->
          <div class="quantityButton" style="padding-top: 45px">
            Quantity
            <input type="number"
              style="outline: none; padding:5px; border-radius: 5px; box-shadow: 0 2px 5px rgba(0,0,0,.5); margin: 0 5px !important" value="1">
          </div>

          <div class="purchase">
              <button type="button" href="https://www.google.com" class="btn btn-light" data-toggle="button" style="margin-top: 40px; position: relative; left: 85px;">Buy</button>
          </div>
          
        </div>
        
      </div>

      <hr>

    </div>

  </div>

  <script src="https://code.jquery.com/jquery-3.4.1.min.js"
    integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>

  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

  <!-- BUTTON QUANTITY -->
  <script src="static/js/jquery.nice-number.js"></script>

  <script>
      const ProductApp = angular.module("app", []);

        // Add $http service component into our MainCtrl controller
        //productApp.controller( "MainCtrl", MainCtrl );

        ProductApp.controller("MainCtrl", ['$scope', '$http', MainCtrl]);

        function MainCtrl($scope, $http) {
        const URL = "http://localhost:8080/Outdoor/json/${id}";
            const brandURL = "http://localhost:8080/Outdoor/json/brands";
            $scope.products = [];
            $scope.brands = [];
            $http.get(URL).then(handleJson);

            $http.get(brandURL).then(handleJsonBrands);


            function handleJson(response) {

                 console.log(response.data);
                $scope.product = response.data;
            }

            function handleJsonBrands(response) {
              // console.log(response.data);
              $scope.brands = response.data;
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