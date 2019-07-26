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
        <title>Edit</title>
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
        <link rel="stylesheet" type="text/css" href="static/css/style.css">

    </head>

    <body style="padding-top:0%">

        <!-- NAVBAR HEADER  (BUTTON TOOGLE DOESNT WORK)-->

        <nav class="navbar navbar-expand-lg navbar-light bg-white border" style="padding-left: 150px; padding-right: 150px">

            <img src="https://cdn2.shopify.com/s/files/1/0173/2227/8976/products/mountain-compass-temporary-tattoos-easytatt-6802109694016_2048x2048.jpg?v=1548635909"
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
                        <a href="/Outdoor/logout" class="nav-link">Logout</a>
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
                        <a class="navbar-brand dropdown-toggle" href="#" id="navbarDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                    <img class="card-img-top" style="height: 420px"
                         src="${product.imageUrl}"
                         alt="">
                    <div class="delete mt-5 border-top border-info" style=" font-family: 'Montserrat', sans-serif;  width:470px; height: 150px;">
                    <span class="light-text" style="margin-top: 20px;">Do you want to delete this product?</span>
                    <button style="position:relative; top:72px; right: 292px">Delete</button>
                </div>
                </div>

                <div class="col-md-6 col-sm-6 border border-dark rounded " style="box-shadow:20px 20px 10px grey; ">

                    <form:form method="POST" action="/Outdoor/admin/products" modelAttribute="product" class="main-form needs-validation border" novalidate="novalidate">

                        <form:label path="productsId" type="hidden"></form:label>
                        <form:input path="productsId" type="hidden" />
                        <div class="form-group">

                            <form:label path="name">Name</form:label>
                            <form:input type="text" path="name" id="name" class="form-control" required="required"/>
                            <div class="invalid-feedback">Please enter a valid name</div>
                        </div>
                        <div class="form-group">
                            <form:label path="price">Price</form:label>
                            <form:input type="number" path="price" id="price" class="form-control" required="required"/>
                            <div class="invalid-feedback">Please enter a valid price</div>
                            <small class="form-text text-muted">
                                This should be in euros
                            </small>
                        </div>
                        <div class="form-group">
                            <form:label path="imageUrl">Image_URL</form:label>
                            <form:input type="url" path="imageUrl" id="img_url" class="form-control" required="required"/>
                            <div class="invalid-feedback">Please enter a valid url</div>
                        </div>
                        <div class="form-group">
                            <form:label path="description">Description</form:label>
                            <form:textarea type="text" path="description" id="description" class="form-control" required="required"/>
                            <div class="invalid-feedback">Please enter a valid text</div>

                        </div>      


                        <div class="form-group">
                            <input type="text" readonly="readonly" value="${pBrand.brandname}"/>
                            <%--<form:label path="brand">Brand</form:label>--%>
                            <select name="brandsId" id="brand" class="form-control" value="${pBrand.brandsId}" required="required">
                                <!--here you will need JSTL code 'for-each'--> 

                                <c:forEach items="${brands}" var="b">     
                                    <option value="${b.brandsId}" >${b.brandname}</option>
                                </c:forEach>
                            </select>
                        </div>


                        <div class="form-group">
                            <input type="text" readonly="readonly" value="${pCategory.categoryName}"/>
                            <select name="categoryId" id="category" class="form-control" value="${pCategory.categoryName}" required="required">
                                <!--here you will need JSTL code 'for-each'-->
                                <c:forEach items="${categories}" var="cat">
                                    <option value="${cat.categoryId}" >${cat.categoryName}</option>
                                </c:forEach>     
                            </select>
                        </div>

                        <input type="submit" value="Submit" />


                    </div>
                </form:form>

                <hr>

            </div>




        </div>

        <script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script>
            var form = document.querySelector('.needs-validation');
            form.addEventListener('submit', function (event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            });
        </script>


    </body>
</html>