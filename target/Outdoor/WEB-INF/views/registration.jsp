<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Compass</title>
         <!-- Bootstrap | Ctrl+/ -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        
         <!--Toastr-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.css">
        
         <!-- Monserant-Font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">

        <!-- My CSS -->
        <link rel="stylesheet" type="text/css" href="<c:url value='/static/css/style.css'/>"></link>
        
        <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
       

    </head>

    <body class="big-banner-2">
        <div class="generic-container">
            <div class="well lead">Profile Details</div>
            <form:form method="POST" modelAttribute="user" onsubmit="return validation();" class="form-horizontal needs-validation" novalidate="novalidate">
                <form:input type="hidden" path="id" id="id"/>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="firstName">First Name</label>
                        <div class="col-md-7">
                            <form:input type="text" path="firstName" id="firstName" maxlength="30"
                                        class="form-control input-sm" required="required"/>
                            
                                <div class="invalid-feedback">Please enter a valid name</div>
                           
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="lastName">Last Name</label>
                        <div class="col-md-7">
                            <form:input type="text" path="lastName" id="lastName" maxlength="30"
                                        class="form-control input-sm" required="required" />
                             <div class="invalid-feedback">Please enter a valid last name</div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="ssoId">Username</label>
                        <div class="col-md-7">

                            <form:input type="text" path="ssoId" id="ssoId" maxlength="30"
                                        class="form-control input-sm" required="required"/>
                            <div class="invalid-feedback">Already exists. Please enter a valid username name</div>

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="password">Password</label>
                        <div class="col-md-7">
                            <form:input type="password" path="password" id="password" maxlength="100"
                                        class="form-control input-sm" minlength="6" required="required"/>
                            <div class="invalid-feedback">Must be at least 6 characters. Please enter a valid password</div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="email">Email</label>
                        <div class="col-md-7">
                            <form:input type="email" path="email" id="email" maxlength="30"
                                        class="form-control input-sm" required="required"/>
                           <div class="invalid-feedback">Please enter a valid email address</div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <div class="col-md-7">
                            <input type="hidden" name="userProfiles" value="${userProfile}" class="form-control input-sm" />

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-actions floatRight floatRight2" style="display:flex; justify-content: space-around">
                        <c:choose>
                            <c:when test="${edit}">
                                <button type="submit" value="Update" 
                                        class="btn-block" style="font-size:10px; color:white;">Update</button>  <a href="<c:url value='/products'/>">or Cancel</a>
                            </c:when>
                            <c:otherwise>
                                <button type="submit" value="Register" 
                                        class="btn-block" style="font-size:10px; color:white;">Register</button>  <a href="<c:url value='/products'/>">or Cancel</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </form:form>
        </div>
        
        <!--Toastr-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
        
        <!-- Bootstrap  -->
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

