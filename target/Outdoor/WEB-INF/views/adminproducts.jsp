<%-- 
    Document   : adminproducts
    Created on : 18 Ιουλ 2019, 8:41:46 μμ
    Author     : kat26
--%>

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

        <!-- My CSS -->
        <link rel="stylesheet" type="text/css" href="<c:url value='/static/css/style.css'/>"
    </head>




    <body style="padding-top: 0px">

        <!-- NAVBAR HEADER  (BUTTON TOOGLE DOESNT WORK)-->

        <nav class="navbar navbar-expand-lg navbar-light bg-white border" style="padding-left: 150px; padding-right: 150px;">

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
                        <a href="/Outdoor/logout" class="nav-link" style="font-size: 20px"><i class="far fa-user-circle"></i>  Logout</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- <div class="container" style="margin-left: 40px; margin-right: 40"> -->

        <!-- NAVBAR 2 -->
        <nav class="navbar navbar-expand-sm navbar-light align-center" style="background-color: aquamarine">
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
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
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
                        <a href="#" class="navbar-brand">About</a>
                    </li>
                </ul>
            </div>

        </nav>

        <!-- MAIN BODY -->
        <div class="container" style="margin-top: 30px">
            <div class="row">
                <div class="col-lg-3 border" style="text-align: center">
                    FILTER SECTION                                            

                </div>
                <div class="col-lg-9">
                    <div id="format" class="row">

                        <!-- ITEM 1 -->
                        <c:forEach items='${products}' var='product'>
                            <div class="col-lg-4 col-md-6 mb-4">
                                <div class="card h-100">
                                    <a href="#"><img class="card-img-top" src="${product.imageUrl}" alt=""></a>
                                    <div class="card-body">
                                        <h4 class="card-title">
                                            <a href="#">${product.name}</a>
                                        </h4>
                                        <h5>$${product.price}</h5>
                                        <p id = "descr" class="card-text">${product.description}
                                        </p>
                                    </div>
                                    <!--EDIT--> 
                                    <div class="purchase" style="text-align: center">
                                        <a href="<c:url value="/admin/products/${product.productsId}"/>" class="btn btn-info btn-block" >Edit</a>
                                    </div>
                                    <!--/EDIT--> 
                                    <div class="purchase" style="text-align: center">
                                        <a href="<c:url value="/admin/products/delete/${product.productsId}"/>" class="btn btn-danger btn-block" >Delete</a>
                                    </div>
                                    <div class="card-footer">
                                        <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                                    </div>

                                </div>
                            </div>
                        </c:forEach>

                        <!--          
                                   ITEM 2 
                                  <div class="col-lg-4 col-md-6 mb-4">
                                      <div class="card h-100">
                                        <a href="#"><img class="card-img-top" src="https://images.pexels.com/photos/2376997/pexels-photo-2376997.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940/700x400" alt=""></a>
                                        <div class="card-body">
                                          <h4 class="card-title">
                                            <a href="#">Product Name</a>
                                          </h4>
                                          <h5>$Price</h5>
                                          <p class="card-text">Description Description Description Description Description Description Description 
                                          </p>
                                        </div>
                                        
                                        <div class="card-footer">
                                          <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                                        </div>
                 
                        <!-- /EDIT -->
                        <div class="purchase" style="text-align: center">
                            <a href="/Outdoor/admin/products/new" class="btn btn-danger btn-block" >Insert</a>
                        </div>


                        <!--          
                                   ITEM 2 
                                  <div class="col-lg-4 col-md-6 mb-4">
                                      <div class="card h-100">
                                        <a href="#"><img class="card-img-top" src="https://images.pexels.com/photos/2376997/pexels-photo-2376997.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940/700x400" alt=""></a>
                                        <div class="card-body">
                                          <h4 class="card-title">
                                            <a href="#">Product Name</a>
                                          </h4>
                                          <h5>$Price</h5>
                                          <p class="card-text">Description Description Description Description Description Description Description 
                                          </p>
                                        </div>
                                        
                                        <div class="card-footer">
                                          <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                                        </div>
                                      </div>
                                    </div>
                        
                                     ITEM 3 
                                    <div class="col-lg-4 col-md-6 mb-4">
                                        <div class="card h-100">
                                          <a href="#"><img class="card-img-top" src="https://images.pexels.com/photos/2376997/pexels-photo-2376997.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940/700x400" alt=""></a>
                                          <div class="card-body">
                                            <h4 class="card-title">
                                              <a href="#">Product Name</a>
                                            </h4>
                                            <h5>$Price</h5>
                                            <p class="card-text">Description Description Description Description Description Description Description 
                                            </p>
                                          </div>
                                          <div class="card-footer">
                                            <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                                          </div>
                                        </div>
                            
                                         ITEM 3 
                                        <div class="col-lg-4 col-md-6 mb-4">
                                            <div class="card h-100">
                                              <a href="#"><img class="card-img-top" src="https://images.pexels.com/photos/2376997/pexels-photo-2376997.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940/700x400" alt=""></a>
                                              <div class="card-body">
                                                <h4 class="card-title">
                                                  <a href="#">Product Name</a>
                                                </h4>
                                                <h5>$Price</h5>
                                                <p class="card-text">Description Description Description Description Description Description Description 
                                                </p>
                                              </div>
                                              <div class="card-footer">
                                                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                                              </div>
                                            </div>
                                          </div>
                            
                                            ITEM 4 
                                        <div class="col-lg-4 col-md-6 mb-4">
                                            <div class="card h-100">
                                              <a href="#"><img class="card-img-top" src="https://images.pexels.com/photos/2376997/pexels-photo-2376997.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940/700x400" alt=""></a>
                                              <div class="card-body">
                                                <h4 class="card-title">
                                                  <a href="#">Product Name</a>
                                                </h4>
                                                <h5>$Price</h5>
                                                <p class="card-text">Description Description Description Description Description Description Description 
                                                </p>
                                              </div>
                                              <div class="card-footer">
                                                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                                              </div>
                                            </div>
                                          </div>
                                    </div>
                                  </div>
                                </div>
                              </div>-->

                        <footer class="footer">
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
                                        <ul>
                                            <li class="foo-columns" style="padding-bottom: 18px">
                                                <a href="#" class="text-secondary">
                                                    <i class="fas fa-campground"></i>  tents 
                                                </a>
                                            </li>

                                            <li class="foo-columns" style="padding-bottom: 18px">
                                                <a href="#" class="text-secondary">
                                                    <i class="fas fa-toolbox"></i>  hiking equipment
                                                </a>
                                            </li>

                                            <li class="foo-columns" style="padding-bottom: 18px">
                                                <a href="#" class="text-secondary">
                                                    <i class="fas fa-hiking"></i>  backpacks
                                                </a>
                                            </li>

                                            <li class="foo-columns" style="padding-bottom: 18px">
                                                <a href="#" class="text-secondary">
                                                    <i class="fas fa-medkit"></i>  first-aid kits
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-md-3" style="padding-top: 30px; ">
                                        <h5 class="column-title" style="padding-bottom: 30px ;margin-bottom: 0%">
                                            Contact


                                        </h5>
                                        <ul>
                                            <li class="foo-columns" style="padding-bottom: 18px">
                                                <a href="#" class="text-secondary">
                                                    <i class="far fa-envelope" style=></i> compass@hotmail.com
                                                </a>
                                            </li>

                                            <li class="foo-columns" style="padding-bottom: 18px">
                                                <a href="#" class="text-secondary">
                                                    <i class="fas fa-phone-square"></i>(+30) 6986487890
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
                                                <input class="text-secondary" style="padding-bottom: 5px; border-style: hidden; padding-top: 0%; text-align: center" placeholder="email@example.com"> 
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
                                            <img class="h-size2" src="<c:url value='/static/pictures/paypal.png'/>" alt="IMG-PAYPAL">
                                        </a>
                                        <div class="copyrights" style="padding-top: 20px;">
                                            Copyright © 2019 All rights reserved. | This template is made with <i class="far fa-heart"></i> by AFDEmp Bootcamp 8
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

                        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
                        crossorigin="anonymous"></script>
                        <!--
                            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
                                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
                                crossorigin="anonymous"></script> 
                                
                            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
                                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
                                crossorigin="anonymous"></script>  -->



                        <script>
                            let obj = JSON.parse('${jsonList}');
                            console.log(obj);
                        </script>

                        </body>

                        </html>