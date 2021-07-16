    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="../../resources/css/ecommerce-price-men.css">
        <script src="../../resources/js/ecommerce-price-men.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css"/>
        <link rel="stylesheet" type="text/css" href="../../resources/plugins/slick-master/slick/slick-theme1.css"/>
        <script type="text/javascript" src="../../resources/plugins/slick-master/slick/slick.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.5/pagination.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.5/pagination.css"/>
        <style>
            .for-small-devices-2{display:none}
            @media screen and (max-width:1200px){
                .hide-big-container{display: none;}
            }
            @media screen and (max-width:810px){
                .hide-big-container-1{display: none;}
                .for-small-devices-2{display:block}
            }
            a:hover{color:black}
            a{color:black}

        </style>
        <script>
            function myFunction() {
                document.getElementById("GFG").submit();
            }
        </script>
        <title>Mens Products - SBK</title>
    </head>
    <body>
        
     <!--header part start-->                
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
                    <form:form  id="GFG" action="${pageContext.request.contextPath}/logout" method="post">
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
    
    
    <!--header part end-->
        <!--middle-->
          <div class="container-fluid mt-5 pt-5">
            <div class="row">
              
              <!--left side col start-->
              <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12">
                <div class="container large-left-sider">
                  <div class="row">
                    <div class="col-12 px-0 pt-5 pb-4 text-center pl-0">
                      <input class="search-box" type="text" placeholder="Search.." ><span><button class="search-button"><i class="fa fa-search" id="search-icon"></i></button></span>
                    </div>
                  </div>
                  <div class="row pl-3">
                    <div class="col-12 pt-3">
                      <p style="font-size:20px;text-transform: uppercase;font-weight: 600;">price</p>
                      <span  class="text-bold" name="select-price"><input type="radio" name="price" class="open-content-one-hundred"> &nbsp;&#8377;100-200</span><br>
                      <span  class="text-bold" name="select-price"><input type="radio" name="price" class="open-content-two-hundred"> &nbsp;&#8377;200-300</span><br>
                      <span  class="text-bold" name="select-price"><input type="radio" name="price" class="open-content-three-hundred"> &nbsp;&#8377;300-400</span><br>
                      <span  class="text-bold" name="select-price"><input type="radio"  name="price" class="open-content-four-hundred"> &nbsp;&#8377;400-500</span><br>
                      <span  class="text-bold" name="select-price"><input type="radio"  name="price" class="open-content-five-hundred"> &nbsp;&#8377;500-600</span><br>
                    </div>
                    <div class=" col-12 pt-5">
                      <p style="font-size:20px;text-transform: uppercase;font-weight: 600;">colour</p>
                      <span class="text-bold"><input type="radio" name="color" class="open-content-three-hundred"> &nbsp;blue</span><br>
                      <span class="text-bold"><input type="radio" name="color" class="open-content-five-hundred"> &nbsp;green</span><br>
                      <span class="text-bold"><input type="radio" name="color" class="open-content-two-hundred"> &nbsp;yellow</span><br>
                      <span class="text-bold"><input type="radio" name="color" class="open-content-four-hundred"> &nbsp;black</span><br>
                    </div>
                    <div class=" col-12 pb-5 pt-5">
                      <p style="font-size:20px;text-transform: uppercase;font-weight: 600;">brand</p>
                      <span  class="text-bold"><input type="radio" name="brand" class="open-content-two-hundred"> &nbsp;LOUIS VUITTON</span><br>
                      <span  class="text-bold"><input type="radio" name="brand" class="open-content-three-hundred"> &nbsp;GUCCI</span><br>
                      <span  class="text-bold"><input type="radio" name="brand" class="open-content-four-hundred"> &nbsp; HERMES</span><br>
                      <span  class="text-bold"><input type="radio" name="brand" class="open-content-five-hundred"> &nbsp;PRADA</span><br>
                    </div>
                  </div>
                </div>
              </div>
              <!--left side col end-->
              
              <!--right side col start-->
              
              <!--front look-->
              <div class="col-xl-9 col-lg-9 col-md-9 col-sm-12 col-12 pl-0" style="border-left:1px solid grey">
                
                <div class="container large-right-sider">
                  <div class="row pt-5 hide-front-page">
                  
                  <!-- For Loop -->
<%--                   ${SBK }
                  ${itemDetailsList.get(0) } --%>
                  
                  
                <%--   <c:forEach var="message" items="${str }">
                  ${message }
                  </c:forEach>  --%>
                  
                  
                  <c:forEach var="itemDetail" items="${itemDetailsList }">
                  
					<%-- <c:out value="${itemDetail.getItemName() }"/> --%>
                    <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6  text-center">
                       <a href="../AllCanAccess/product/${itemDetail.getItemId() }"><img src="../../resources/img/products-image/${itemDetail.getFileName1() }" class="img-men" data-aos="fade-up" style="border-radius:20px;height:180px"></a> 
                       <a href="../AllCanAccess/product"><span class="image-lable" data-aos="fade-up"><br>${itemDetail.getItemName() }<br>&#8377;${itemDetail.getPrice() }</span></a>
                    </div>

                    </c:forEach> 
                    <!-- For Loop End -->
                    
                    
                     
                    
                  </div>
                  
                  
                  
                  
                  
                    
                  
                 

              <!--right side col end-->
            </div>
          </div>
         

         
        </div>
  
          <!-- <div class="container" style="height:80vh">
            <div class="row">
              <div class="col-sm-12 text-center pt-5">
               <a href="for-each-image.html"><span style="text-transform: uppercase;font-weight: 700;font-size:30px;">recommend</span></a>
              </div>
            </div>
            <div class="row single-slider pt-5">
              <div class="col text-center">
                <span style="display:flex;justify-content: center;"><a href="for-each-image.html"><img src="../../resources/img/boys-dress-1.jpeg" height="250px" style="background-color:black"></a></span>
                 <a href="for-each-image.html"><span class="image-lable">tradesional dress<br>&#8377;180.00</span></a> 
              </div>
              
              
            </div>
          </div>
          
          
          
          
          
          </div> -->
          
          
          </div>
          <!--footer-->
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