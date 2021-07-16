<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/ecommerce.css">
        <script src="${pageContext.request.contextPath }/resources/js/ecommerce.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
                <script>
            function myFunction() {
                document.getElementById("GFG").submit();
            }
        </script>
        <title>Home - SBK</title>
        
    </head>
    <body>
    
    <!-- Header Started -->
        <div class="carousel slide" data-ride="carousel" style="z-index:1">
            <div class="container-fluid text-white" id="change-color">
              <div class="row" id="top-containt">
                <div class="col-4 text-center">
                  <a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath }/resources/img/shopping-logo.png" height="130px" class="color logo-1 logo-sift"></a>
                  <a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath }/resources/img/pinterest_icon.png" height="70px" class=" color logo-2 mt-1 ml-2"></a>
               
                </div>
                <div class="col-8 pt-4 mt-1 text-center">
                  <span class="dropdown dropdown-toggle profile" data-toggle="dropdown" style="color:black" >
                    <a href="#/"><img src="${pageContext.request.contextPath}/resources/img/profile-icon.png" class="profile-icon color"></a>
                  </span>
                  <ul class="dropdown-menu mt-4 text-center" style="margin-left:-6%;border-radius:10px;">
                    <li class="pre-profile-1 pt-2 pb-2"><a href="${pageContext.request.contextPath}/AllCanAccess/helpCenter" class="color" style="font-weight:600">Help Center </a></li>
                    <li class="pre-profile-1 pt-2 pb-2"><a href="${pageContext.request.contextPath}/AllCanAccess/covid19" class="color" style="font-weight:600">COVID 19 FAQ</a></li>
                    
                    <security:authorize access="isAuthenticated()">
                    <li class="pre-profile-1 pt-2 pb-2"><a href="${pageContext.request.contextPath}/Protected/viewProfile/<security:authentication property="principal.username"/>" class="color" style="font-weight:600">&nbsp&nbsp<security:authentication property="principal.username"/> &nbsp</a></li>
                    </security:authorize>
                    <security:authorize access="isAuthenticated()">
                    <li class="pre-profile-1 pt-2 pb-2"><a href="${pageContext.request.contextPath}/Protected/viewProfile/<security:authentication property="principal.username"/>" class="color" style="font-weight:600">View Profile</a></li>
                    <li class="pre-profile-1 pt-2 pb-2"><a href="${pageContext.request.contextPath}/Protected/updateProfile" class="color" style="font-weight:600">Update Profile</a></li>
                    <form:form  id="GFG" action="logout" method="post">
                    <li class="pre-profile-1 pt-2 pb-2"><a href="#" onclick="myFunction()" class="color" style="font-weight:600">Log out</a></li>
					</form:form>
                    </security:authorize>
                    <security:authorize access="!isAuthenticated()">
                    <li class="pre-profile-1 pt-2 pb-2"><a href="${pageContext.request.contextPath}/login" class="color" style="font-weight:600">Log In</a></li>
                    </security:authorize>
                    
                    
                    
                  </ul>
                  <span class="menu-1"><a href="${pageContext.request.contextPath}" class="color">home</a></span>
                  <span class="menu"><a href="${pageContext.request.contextPath}/AllCanAccess/products" class="color">products</a></span>
                  <span class="menu"><a href="${pageContext.request.contextPath}/AllCanAccess/aboutUs" class="color">about</a></span>
                  <span class="menu"><a href="${pageContext.request.contextPath}/AllCanAccess/contact" class="color">contact</a></span>
                  
                  
                  
                  <security:authorize access="hasRole('USER')">
                  <span class="menu"><a href="${pageContext.request.contextPath}/cart" class="color">CART </a></span>
                   </security:authorize>
                   
                   <security:authorize access="hasRole('ADMIN')">
                   <span class="menu"><a href="${pageContext.request.contextPath}/Granted/allOrders" class="color">View All Orders </a></span>
                   </security:authorize>
                   
                  <span class="menu-bar text-right"><a href="#/" class="color">&#9776;</a></span>
                  <span class="menu-bar-1 text-right"><a href="#/" class="color">&#9776;</a></span>
                  <span class="menu-bar-2 text-right"><a href="#/" class="color">&#9776;</a></span>
                </div>
              </div>
            </div>
            
            <!-- Header Ended -->
            
            
            
            <div class="carousel-inner text-center">
              <div class="carousel-item" style="height:100vh"> 
                <div style="height:100vh;width:100vw" class="text-right pr-5">
                  <div class="container pt-4">
                    <div class="row mt-3 pt-5">
                      <div class="col-12 text-center pt-5">
                        <a href="AllCanAccess/sale"><span class="box"><img src="resources/img/sale-box.jpg" height="320px"  style="transform: translateY(10%);"></span></a>
                        <a href="AllCanAccess/sale"><img src="resources/img/sale-1..png" height="300px" class="sale-img"></a>
                      </div>
                    </div>
                  </div>
                </div>
              </div> 
              <div class="carousel-item" style="height:100vh">
                  <div class="container mt-4 pt-5">
                    <div class="row pt-5 pb-5">
                      <div class="col-12 text-center pb-4">
                        <a href="AllCanAccess/sale"><span class="hide-banner"><img src="resources/img/ballon.jpg" height="350px;"></span></a>
                        <a href="AllCanAccess/sale"><img src="resources/img/background-image.jpg" height="450px" class="sift-girl" style="margin-top:-3%"></a>
                        <a href="AllCanAccess/sale"><span class="hide-girl"><img src="resources/img/sale-tag.jpg" height="430px;"></span></a>
                      </div>
                    </div>
                  </div>
              </div>
              <div class="carousel-item active" style="height:100vh">
                <div class="container pt-2 pt-5 pb-5">
                  <div class="row pt-5 pb-5">
                    <div class="col-12 text-center pb-5 pt-4">
                        <a href="AllCanAccess/sale"><span class="hide-lady-1"><img src="resources/img/background-image-1.jpg" height="350px" style="padding-left:6%;margin-top:3%;"></span></a>
                        <a href="AllCanAccess/sale"><span class="special"><img src="resources/img/sale.jpg" height="350px" style="padding-left:3%;margin-top:3%"></span></a>
                        <a href="AllCanAccess/sale"><span class="hide-lady"><img src="resources/img/background-image-2.jpg" height="320px"></span></a>
                    </div>
                  </div>
                </div>
              </div>
          </div>
        </div>
          <div class='container-fluid pb-3'>
            <div class="row">
              <div class="col text-center">
                <a href="ecommerce-price-men.html"><span style="font-size:30px;text-transform:uppercase;font-weight:bold" data-aos="zoom-in">popular</span></a>
              </div>
            </div>
          </div>
          
          
          <div class="container-fluid pt-5" style="background-color:white">
            <div class="container"> 
              <div class="row text-center">
                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 text-center">
                  <div class="container pl-0" height="250px" width="250px" style="overflow:hidden">
                    <a href="AllCanAccess/product/${mensItemDetailsList.get(0).getItemId() }"><img src="resources/img/products-image/${mensItemDetailsList.get(0).getFileName1() }" class="img-men" data-aos="fade-up" style="border-radius:20px;"><br></a>
                    <a href="AllCanAccess/product/${mensItemDetailsList.get(0).getItemId() }"><span class="image-lable" data-aos="fade-up">${mensItemDetailsList.get(0).getItemName() }<br>&#8377; ${mensItemDetailsList.get(0).getPrice() }</span></a>
                  </div>
                </div>
                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 text-center popular-sift-down">
                  <div class="container pl-0" height="250px" width="250px" style="overflow:hidden">
                    <a href="AllCanAccess/product/${mensItemDetailsList.get(1).getItemId() }"><img src="resources/img/products-image/${mensItemDetailsList.get(1).getFileName1() }" class="img-men" style="border-radius:20px;" data-aos="fade-up"><br></a>
                    <a href="AllCanAccess/product/${mensItemDetailsList.get(1).getItemId() }"><span class="image-lable" data-aos="fade-up" >${mensItemDetailsList.get(1).getItemName() }<br>&#8377; ${mensItemDetailsList.get(1).getPrice() }</span></a>
                  </div>
                </div>
                <div class="col-xl-3 col-lg-4 hide-lady-1">
                  <div class="container pl-0 text-center" height="250px" width="250px" style="overflow:hidden">
                    <a href="AllCanAccess/product/${kidsItemDetailsList.get(0).getItemId() }"><img src="resources/img/products-image/${kidsItemDetailsList.get(0).getFileName1() }" class="img-men" style="border-radius:20px;" data-aos="fade-up"></a>
                    <a href="AllCanAccess/product/${kidsItemDetailsList.get(0).getItemId() }"><span class="image-lable" data-aos="fade-up">${kidsItemDetailsList.get(0).getItemName() }<br>&#8377; ${kidsItemDetailsList.get(0).getPrice() }</span></a>
                  </div>
                </div>
                <div class="col-xl-3 hide-lady">
                  <div class="container pl-0 text-center" height="250px" width="250px" style="overflow:hidden">
                    <a href="AllCanAccess/product/${kidsItemDetailsList.get(1).getItemId() }"><img src="resources/img/products-image/${kidsItemDetailsList.get(1).getFileName1() }" class="img-men" style="border-radius:20px;" data-aos="fade-up"></a>
                    <a href="AllCanAccess/product/${kidsItemDetailsList.get(1).getItemId() }"><span class="image-lable pl-3" data-aos="fade-up">${kidsItemDetailsList.get(1).getItemName() }<br>&#8377; ${kidsItemDetailsList.get(1).getPrice() }</span></a>
                  </div>
                </div>
              </div>
              <div class="row pt-5 pb-4 text-center">
                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 text-center">
                  <div class="container pl-0" height="250px" width="250px" style="overflow:hidden">
                    <a href="AllCanAccess/product/${kidsItemDetailsList.get(2).getItemId() }"><img src="resources/img/products-image/${kidsItemDetailsList.get(2).getFileName1() }" class="img-men" style="border-radius:20px;" data-aos="fade-up"><br></a>
                    <a href="AllCanAccess/product/${kidsItemDetailsList.get(2).getItemId() }"><span class="image-lable" data-aos="fade-up">${kidsItemDetailsList.get(2).getItemName() }<br>&#8377; ${kidsItemDetailsList.get(2).getPrice() }</span></a>
                  </div>
                </div>
                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 text-center popular-sift-down">
                    <div class="container pl-0" height="250px" width="250px" style="overflow:hidden">
                    <a href="AllCanAccess/product/${ladiesItemDetailsList.get(0).getItemId() }"><img src="resources/img/products-image/${ladiesItemDetailsList.get(0).getFileName1() }" class="img-men" style="border-radius:20px;" data-aos="fade-up"><br></a>
                    <a href="AllCanAccess/product/${ladiesItemDetailsList.get(0).getItemId() }"><span class="image-lable" data-aos="fade-up">${ladiesItemDetailsList.get(0).getItemName() }<br>&#8377; ${mensItemDetailsList.get(0).getPrice() }</span></a>
                  </div>
                </div>
                <div class="col-xl-3 col-lg-4 text-center hide-lady-1">
                  <div class="container pl-0" height="250px" width="250px" style="overflow:hidden">
                    <a href="AllCanAccess/product/${ladiesItemDetailsList.get(1).getItemId() }"><img src="resources/img/products-image/${ladiesItemDetailsList.get(1).getFileName1() }" class="img-men" style="border-radius:20px;" data-aos="fade-up"></a>
                    <a href="AllCanAccess/product/${ladiesItemDetailsList.get(1).getItemId() }"><span class="image-lable" data-aos="fade-up">${ladiesItemDetailsList.get(1).getItemName() }<br>&#8377; ${ladiesItemDetailsList.get(1).getPrice() }</span></a>
                  </div>
                </div>
                <div class="col-xl-3 text-center hide-lady">
                  <div class="container pl-0" height="250px" width="250px" style="overflow:hidden">
                    <a href="AllCanAccess/product/${ladiesItemDetailsList.get(2).getItemId() }"><img src="resources/img/products-image/${ladiesItemDetailsList.get(2).getFileName1() }" class="img-men" style="border-radius:20px;" data-aos="fade-up"></a>
                    <a href="AllCanAccess/product/${ladiesItemDetailsList.get(2).getItemId() }"><span class="image-lable" data-aos="fade-up">${ladiesItemDetailsList.get(2).getItemName() }<br>&#8377; ${ladiesItemDetailsList.get(2).getPrice() }</span></a>
                  </div>
                </div>
              </div>
              <div class="row mb-1 pb-3">
                <div class="col-12 pb-5 text-center">
                  <a href="AllCanAccess/products"><span style="font-weight:700;font-size:20px;color:blue" data-aos="zoom-in">see more</span><span class="pl-3" style="color:blue"><i class="fa fa-arrow-right" aria-hidden="true" data-aos="zoom-in"></i></span></a>
                </div>
              </div>
            </div>
          </div>
          
          
          <div class="container-fluid transparent pt-5 pb-5" id="parallax1" style="background-image:url('resources/img/desktop.jpg');background-size:cover;background-attachment:fixed;">
            <div class="container sift-couple" height="200px">
              <div class="row">
                <div class="col-xl-5 col-lg-5 col-md-6 col-sm-12 col-12 text-center">
                  <a href="ecommerce-price-men.html"><img src="resources/img/wedding-couple.jpg" height="230px" class="pl-5" data-aos="fade-up"></a>
                </div>
                <div class="col-xl-7 col-lg-7 col-md-6 col-sm-12 col-12 pt-4 text-center"> 
                  <span style="font-weight:700;font-size:20px;" data-aos="zoom-in">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                Vestibulum consequat quam vel diam iaculis consectetur.
                Praesent ac arcu sem. Nulla consectetur magna ac libero
                rutrum malesuada. Class aptent taciti sociosqu ad litora
                torquent per conubia nostra, per</span><br><br><a href="AllCanAccess/products"><span style="font-size:20px;color:rgb(180, 69, 69);font-weight: 800;text-transform: uppercase;" data-aos="zoom-in">choose your wedding dress</span></a>
                </div>
              </div>
            </div>
          </div>
          <div class="container-fluid mt-5">
           <div class="container pt-3 pb-3">
           
           <div class="row">
           
           
           
           
               <div class="col-sm-12 text-center pb-4">
                 <a href="#"><span style="text-transform: uppercase;font-weight: 700;font-size:30px;" data-aos="zoom-in">men's dress</span></a>
               </div>
              </div>
           
           
           
           
           
           
           
           
           
			<div class="row pt-1">
              <div class="col-xl-5 col-lg-5 text-center pt-5 hide-popular">
                <a href="AllCanAccess/product/${mensItemDetailsList.get(0).getItemId() }"><img src="resources/img/products-image/${mensItemDetailsList.get(0).getFileName1() }" height="400px" data-aos="fade-up"><br></a>
                <a href="AllCanAccess/product/${mensItemDetailsList.get(0).getItemId() }"><span class="image-lable" data-aos="zoom-in">${mensItemDetailsList.get(0).getItemName() }<br>&#8377; ${mensItemDetailsList.get(0).getPrice() }</span></a>
              </div>
              <div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
	                <div class="row">
	                  <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12 text-center pt-3">
	                    <a href="AllCanAccess/product/${mensItemDetailsList.get(4).getItemId() }"><img src="resources/img/products-image/${mensItemDetailsList.get(4).getFileName1() }" height="200px" data-aos="fade-up"><br></a>
	                <a href="AllCanAccess/product/${mensItemDetailsList.get(4).getItemId() }"><span class="image-lable" data-aos="zoom-in">${mensItemDetailsList.get(4).getItemName() }<br>&#8377; ${mensItemDetailsList.get(4).getPrice() }</span></a>
	                  </div>
	                  <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12 text-center pt-3">
	                    <a href="AllCanAccess/product/${mensItemDetailsList.get(1).getItemId() }"><img src="resources/img/products-image/${mensItemDetailsList.get(1).getFileName1() }" height="200px" data-aos="fade-up"><br></a>
	                    <a href="AllCanAccess/product/${mensItemDetailsList.get(1).getItemId() }"><span class="image-lable" data-aos="zoom-in">${mensItemDetailsList.get(1).getItemName() }<br>&#8377; ${mensItemDetailsList.get(1).getPrice() }</span></a>
	                  </div>
	                </div>
	                <div class="row">
	                
	                
	                  <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12 text-center pt-3">
	                    <a href="AllCanAccess/product/${mensItemDetailsList.get(2).getItemId() }"><img src="resources/img/products-image/${mensItemDetailsList.get(2).getFileName1() }" height="200px" data-aos="fade-up"><br></a>
	                    <a href="AllCanAccess/product/${mensItemDetailsList.get(2).getItemId() }"><span class="image-lable" data-aos="zoom-in">${mensItemDetailsList.get(2).getItemName() }<br>&#8377; ${mensItemDetailsList.get(2).getPrice() }</span></a>
	                  </div>
	                  
	                  
	                  <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12 text-center pt-3">
	                    <a href="AllCanAccess/product/${mensItemDetailsList.get(3).getItemId() }"><img src="resources/img/products-image/${mensItemDetailsList.get(3).getFileName1() }" height="200px" data-aos="fade-up"><br></a>
	                    <a href="AllCanAccess/product/${mensItemDetailsList.get(3).getItemId() }"><span class="image-lable" data-aos="zoom-in">${mensItemDetailsList.get(3).getItemName() }<br>&#8377; ${mensItemDetailsList.get(3).getPrice() }</span></a>
	                  </div>
	                  
	                  
	                </div>
	                
                
              </div>
              
              
              
            </div>
           
           
           
           
           
              </div>
              
              
           
           
           
              
              
              
              
              
            </div>
            <div class="container pr-5 text-center mt-2 pb-3">
              <div class="row pt-5">
                <div class="col">
                  <a href="AllCanAccess/products/mens"><span style="border:3px solid rgb(180, 69, 69);border-radius:10px;padding:1% 2%;background-color:rgb(177, 84, 84);" class="ml-4" data-aos="zoom-in"><span style="font-weight:700;font-size:20px;color:white;text-transform: uppercase;">more</span><span class="pl-3" style="color:white;"><i class="fa fa-arrow-right" aria-hidden="true"></i></span></span></a>
                </div>
              </div>
            </div>
          </div> 
          </div>
          
          
          
          
          
           <div class="container-fluid mt-4 pt-2">
            <div class="container pt-4 pb-4">
              <div class="row">
               <div class="col-sm-12 text-center pb-4">
                 <a href="#"><span style="text-transform: uppercase;font-weight: 700;font-size:30px;" data-aos="zoom-in">ladies dress</span></a>
               </div>
              </div>
           <div class="row">
               <div class="col-xl-5 col-lg-5 text-center pt-5 hide-popular">
                 <a href="AllCanAccess/product/${ladiesItemDetailsList.get(0).getItemId() }"><img src="resources/img/products-image/${ladiesItemDetailsList.get(0).getFileName1() }" height="400px" data-aos="fade-up"><br></a>
                 <a href="AllCanAccess/product/${ladiesItemDetailsList.get(0).getItemId() }"><span class="image-lable" data-aos="zoom-in">${ladiesItemDetailsList.get(0).getItemName() }<br>&#8377; ${ladiesItemDetailsList.get(0).getPrice() }</span></a>
               </div>
               <div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
                 <div class="row">
                   <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12 text-center pt-3">
                     <a href="AllCanAccess/product/${ladiesItemDetailsList.get(1).getItemId() }"><img src="resources/img/products-image/${ladiesItemDetailsList.get(1).getFileName1() }" height="200px" data-aos="fade-up"><br></a>
                 <a href="AllCanAccess/product/${ladiesItemDetailsList.get(1).getItemId() }"><span class="image-lable" data-aos="zoom-in">${ladiesItemDetailsList.get(1).getItemName() }<br>&#8377; ${ladiesItemDetailsList.get(1).getPrice() }</span></a>
                   </div>
                   <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12 text-center pt-3">
                     <a href="AllCanAccess/product/${ladiesItemDetailsList.get(2).getItemId() }"><img src="resources/img/products-image/${ladiesItemDetailsList.get(2).getFileName1() }" height="200px" data-aos="fade-up"><br></a>
                     <a href="AllCanAccess/product/${ladiesItemDetailsList.get(2).getItemId() }"><span class="image-lable" data-aos="zoom-in">${ladiesItemDetailsList.get(2).getItemName() }<br>&#8377; ${ladiesItemDetailsList.get(2).getPrice() }</span></a>
                   </div>
                 </div>
                 <div class="row">
                   <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12 text-center pt-3">
                     <a href="AllCanAccess/product/${ladiesItemDetailsList.get(3).getItemId() }"><img src="resources/img/products-image/${ladiesItemDetailsList.get(3).getFileName1() }" height="200px" data-aos="fade-up"><br></a>
                     <a href="AllCanAccess/product/${ladiesItemDetailsList.get(3).getItemId() }"><span class="image-lable" data-aos="zoom-in">${ladiesItemDetailsList.get(3).getItemName() }<br>&#8377; ${ladiesItemDetailsList.get(3).getPrice() }</span></a>
                   </div>
                   <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12 text-center pt-3">
                     <a href="AllCanAccess/product/${ladiesItemDetailsList.get(4).getItemId() }l"><img src="resources/img/products-image/${ladiesItemDetailsList.get(4).getFileName1() }" height="200px" data-aos="fade-up"><br></a>
                     <a href="AllCanAccess/product/${ladiesItemDetailsList.get(4).getItemId() }"><span class="image-lable" data-aos="zoom-in">${ladiesItemDetailsList.get(4).getItemName() }<br>&#8377; ${ladiesItemDetailsList.get(4).getPrice() }</span></a>
                   </div>
                 </div>
               </div>
          </div>
          
           <div class="container pr-5 text-center mt-2 pb-3">
              <div class="row pt-5">
                <div class="col">
                  <a href="AllCanAccess/products/ladies"><span style="border:3px solid rgb(180, 69, 69);border-radius:10px;padding:1% 2%;background-color:rgb(177, 84, 84);" class="ml-4" data-aos="zoom-in"><span style="font-weight:700;font-size:20px;color:white;text-transform: uppercase;">more</span><span class="pl-3" style="color:white;"><i class="fa fa-arrow-right" aria-hidden="true"></i></span></span></a>
                </div>
              </div>
            </div>
          </div> 
          </div>
          <div class="container pt-4 pb-5">
            <div class="row">
              <div class="col-sm-12 text-center">
                <a href="#l"><span style="text-transform: uppercase;font-weight: 700;font-size:30px;" data-aos="zoom-in">kids dress</span></a>
              </div>
            </div>
          </div> 
          <div class="container-fluid pt-5 pb-3 px-0" id = "parallax2" style="background-image:url('resources/img/desktop-1.jpg');background-size:cover;background-attachment: fixed;">
            <div class="container" height="200px">
              <div class="row pt-1">
              
              
              
               <div class="col-xl-3 col-lg-3  col-md-4 col-sm-6 col-12 pb-3 text-center">
                <a href="AllCanAccess/product/${kidsItemDetailsList.get(0).getItemId() }"><img src="resources/img/products-image/${kidsItemDetailsList.get(0).getFileName1() }" height="200px" style="border-radius:20px;" data-aos="fade-up"><br></a>
                     <a href="AllCanAccess/product/${kidsItemDetailsList.get(0).getItemId() }"><span class="image-lable" data-aos="zoom-in">${kidsItemDetailsList.get(0).getItemName() }<br>&#8377; ${kidsItemDetailsList.get(0).getPrice() }</span></a>
               </div>
               
               <div class="col-xl-3 col-lg-3  col-md-4 col-sm-6 col-12 pb-3 text-center">
                <a href="AllCanAccess/product/${kidsItemDetailsList.get(1).getItemId() }"><img src="resources/img/products-image/${kidsItemDetailsList.get(1).getFileName1() }" height="200px" style="border-radius:20px;" data-aos="fade-up"><br></a>
                     <a href="AllCanAccess/product/${kidsItemDetailsList.get(1).getItemId() }"><span class="image-lable" data-aos="zoom-in">${kidsItemDetailsList.get(1).getItemName() }<br>&#8377; ${kidsItemDetailsList.get(1).getPrice() }</span></a>
               </div>
               
               
               <div class="col-xl-3 col-lg-3  col-md-4 col-sm-6 col-12 pb-3 text-center">
                <a href="AllCanAccess/product/${kidsItemDetailsList.get(2).getItemId() }"><img src="resources/img/products-image/${kidsItemDetailsList.get(2).getFileName1() }" height="200px" style="border-radius:20px;" data-aos="fade-up"><br></a>
                     <a href="AllCanAccess/product/${kidsItemDetailsList.get(2).getItemId() }"><span class="image-lable" data-aos="zoom-in">${kidsItemDetailsList.get(2).getItemName() }<br>&#8377; ${kidsItemDetailsList.get(2).getPrice() }</span></a>
               </div>
               
               
               <div class="col-xl-3 col-lg-3  col-md-4 col-sm-6 col-12 pb-3 text-center">
                <a href="AllCanAccess/product/${kidsItemDetailsList.get(3).getItemId() }"><img src="resources/img/products-image/${kidsItemDetailsList.get(3).getFileName1() }" height="200px" style="border-radius:20px;" data-aos="fade-up"><br></a>
                     <a href="AllCanAccess/product/${kidsItemDetailsList.get(3).getItemId() }"><span class="image-lable" data-aos="zoom-in">${kidsItemDetailsList.get(3).getItemName() }<br>&#8377; ${kidsItemDetailsList.get(3).getPrice() }</span></a>
               </div>
               
               
               
               
              </div>
            </div>
            <div class="row">
              <div class="col pt-4 pb-5 text-center">
                <a href="AllCanAccess/products/kids"><span style="border:3px solid rgb(180, 69, 69);border-radius:10px;padding:1% 2%;background-color:rgb(177, 84, 84);" class="ml-4" data-aos="zoom-in"><span style="font-weight:700;font-size:20px;color:white;text-transform: uppercase;">more</span><span class="pl-3" style="color:white;"><i class="fa fa-arrow-right" aria-hidden="true"></i></span></span></a>
              </div>
            </div>
          </div>
          <div class="container-fluid mt-5 pt-2 bg-dark text-white">
            <div class="container">
            <div class="row">
              <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-12 footer pt-5">
                <a href="#/"><p style="font-size:20px;text-transform: uppercase;font-weight: 800;color:white" data-aos="slide-right">Scottie Hampton - SBK</p></a>
                <p data-aos="slide-right">The ultimate clothing to see the world in.<br>
                <br>
                <br> 
                <br></p>
              </div>
              <div class="col-xl-3 pt-5 hide-girl">
                <a href="#/"><span style="font-size:20px;text-transform: uppercase;font-weight: 800;color:white" data-aos="zoom-in-left">Names</span><br></a>
                <p style="margin-top:3%" data-aos="slide-up">Chirag Sardana</p>
                <p style="margin-top:-3%" data-aos="slide-up">Aastha</p>
                <p style="margin-top:-3%" data-aos="slide-up">Mohit</p>
                <p style="margin-top:-3%;" data-aos="slide-up">Raghavender</p>
             </div>
              <div class="col-xl-3 col-lg-4 col-md-4 col-sm-12 col-12 footer  pt-5">
                <a href="#"><span style="font-size:20px;text-transform: uppercase;font-weight: 800;color:white" class="text-center" data-aos="zoom-in-left">useful link</span><br></a>
                <a href="?mylocale=en"><p style="margin-top:3%;margin-left:1%;"data-aos="fade-up">United States - English</p></a>


               <a href="?mylocale=fr"> <p style="margin-top:-3%;margin-left:1%;"data-aos="fade-up">Canada - Français</p></a>
              </div>
              <div class="col-xl-2 col-lg-4 col-md-4 col-sm-12 col-12 footer pt-5 pb-3">
                <a href="#/"><p style="font-size:20px;text-transform: uppercase;font-weight: 800;color:white" data-aos="slide-left">contact</p></a>
                <p data-aos="fade-up"><i class="fa fa-home" aria-hidden="true" style="font-size:20px;"></i>&nbsp; Sirsa, Haryana</p>
                <p data-aos="fade-up"><i class="fa fa-envelope" aria-hidden="true"></i>&nbsp; info@SBK.com</p>
                <p data-aos="fade-up"><i class="fa fa-phone" aria-hidden="true"></i>&nbsp; + 91 8684 076 ***</p>
                <p data-aos="fade-up"><i class="fa fa-print" aria-hidden="true"></i>&nbsp; + 91 7015 837 ***</p>
              </div>
            </div>
          </div>
          <hr style="color:white;width:100%;border:1px solid">
          <div class="container mt-4 pb-4">
            <div class="row">
              <div class="col-12 col-xl-6 col-lg-6 col-md-6 col-sm-6 ">
                <p><a href="#/" style="color:white">© 2021 Copyright:</a><span style="font-weight:600;"><a href="#/" style="color:white">SBK</a></span></p></a>
              </div>
              <div class="col-12 col-xl-6 col-lg-6 col-md-6 col-sm-6 icon-head">
                <a href="https://www.facebook.com/Sardanaboykanu/"><span class="icons-2" style="color:white"><i class="fa fa-facebook" aria-hidden="true"></i></span></a>
                <a href="https://twitter.com/sardanaboykanu"><span class="icons-3" style="color:white"><i class="fa fa-twitter" aria-hidden="true"></i></span></a>
                <a href="https://chiragsardana.github.io/"><span class="icons-1" style="color:white"><i class="fa fa-google-plus" aria-hidden="true"></i></span></a>
                <a href="https://www.instagram.com/sardana_boy_kanu/"><span class="icons" style="color:white"><i class="fa fa-instagram" aria-hidden="true"></i></span></a>
              </div>
            </div>
          </div>
          </div>
          <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
          <script>
            AOS.init({
              once:true,
              duration:1000,
            });
          /* const parallax1 =document.getElementById('parallax1');
          const parallax2 =document.getElementById('parallax2');
          window.addEventListener("scroll",function(){
            let offset = window.pageYOffset;
            parallax1.style.backgroundPositionY = offset * 0.4 + 'px';
            parallax2.style.backgroundPositionY = offset * 0.9 + 'px';
          });*/
        </script>
    </body>
</html>