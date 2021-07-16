<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="resources/css/ecommerce.css">
        <script src="resources/js/ecommerce.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="resources/css/login-form.css">
        <script src="resources/js/login-form.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="resources/css/login-form.css">
        <script src="resources/js/login-form.js"></script>
        <script>
            function myFunction() {
                document.getElementById("SignUpForm").submit();
            }
        </script>
        <title>SignUp - SBK</title>
    </head>
    <body>
        <div class="carousel slide" data-ride="carousel" style="z-index:1">
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
                    <%-- <form:form  id="GFG" action="${pageContext.request.contextPath}/logout" method="post">
                    <li class="pre-profile-1 pt-2 pb-2"><a href="#" onclick="myFunction()" class="color" style="font-weight:600">Log out</a></li>
					</form:form> --%>
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
            <br></br>
            
            
            <div class="container">
            <form:form id="SignUpForm" action="otp" method="POST" modelAttribute ="userDetails">
            <div class="container form bg-white pt-5 mt-4 mb-3">
				<p class="text-center login-heading hide-me">sign up</p>
                <div class="row">
                <c:if test="${errorMessage != null}">
               
                <div class="alert alert-success col-xs-offset-1 col-xs-10">${errorMessage }</div>
                 </c:if>
                <br>
                    <div class="col mt-4 pl-5 pr-5">
                        <p class="username">First name</p>
                        <div class="row mt-4">
                            <div class="col-2 text-center pt-1 pr-0">
                                <i class="fa fa-user-o" aria-hidden="true" id="user"></i>
                            </div>
                            <div class="col-10 pl-0">
                            <form:input path="firstName" maxlength="30" placeholder="Type your First Name" class='first-name'/>
							<form:errors path="firstName" />
                            </div>
                        </div>
                        <hr class="hr-1">
                        <div class="first-name-hide"></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col mt-4 pl-5 pr-5">
                        <p class="username">Last name</p>
                        <div class="row mt-4">
                            <div class="col-2 text-center pt-1 pr-0">
                                <i class="fa fa-user-o" aria-hidden="true" id="user"></i>
                            </div>
                            <div class="col-10 pl-0">
                            <form:input path="lastName" maxlength="30" placeholder="Type your Last Name" class='last-name'/>
							<form:errors path="lastName" />
                                
                            </div>
                        </div>
                        <hr class="hr-1">
                        <div class="last-name-hide"></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col mt-4 pl-5 pr-5">
                        <p class="username">Email-id</p>
                        <div class="row mt-4">
                            <div class="col-2 text-center pt-1 pr-0">
                                <i class="fa fa-envelope-o" aria-hidden="true" id="user"></i>
                            </div>
                            <div class="col-10 pl-0">
                                 <form:input path="emailId" maxlength="30" placeholder="Type your Email Id" class='email'/>
								<form:errors path="emailId" />
                            </div>
                        </div>
                        <hr class="hr-1">
                        <div class="email-hide"></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col mt-4 pl-5 pr-5">
                        <p class="username">Password</p>
                        <div class="row mt-4">
                            <div class="col-2 text-center pt-1 pr-0">
                                <i class="fa fa-lock" aria-hidden="true" id="lock"></i>
                            </div>
                            <div class="col-10 pl-0">
                                <form:input path="password" maxlength="100" placeholder="Type your password" class='password-signup'/>
								<form:errors path="password" />
                            </div>
                        </div>
                        <hr class="hr-2">
                        <div class="password-signup-hide"></div>
                    </div>
                </div>
                


                <div class="row">
                    <div class="col pl-5">
                        <a href="#"><span class="forget-password">I accept the <span style="text-transform:capitalize;color:blue">terms of use</span>&
                            <span style="text-transform:capitalize;color:blue">privacy policy</span> </a>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col pl-5 pr-5">
                        <a href="#" onclick="myFunction()"><span class="btn btn-block text-white signup-button">sign up</span></a>
                    </div>
                </div>
                
                
                 </form:form>
                 
               <div class="row mt-5">
                    <div class="col text-center">
                        <span style="text-transform: capitalize;font-family: Arial, Helvetica, sans-serif;font-size:15px;font-weight:600;color:rgb(148, 141, 141)">or sign up using</span>
                    </div>
                </div>
                <div class="row mt-5">
                    <div class='col text-center'>
                        <span class="facebook-icon"><i class="fa fa-facebook" aria-hidden="true"></i></span>
                        <span class="twitter-icon"><i class="fa fa-twitter" aria-hidden="true"></i></span>
                        <span class="google-icon"><i class="fa fa-google" aria-hidden="true"></i></span>
                    </div>
                </div>
                <div class="row mt-5">
                    <div class="col text-center">
                        <span style="text-transform: capitalize;font-family: Arial, Helvetica, sans-serif;font-size:15px;font-weight:600;color:rgb(148, 141, 141)">already have an account</span>
                    </div>
                    <div class="col-12 text-center pt-3">
                        <a href="login"><span class="sign-up">login</span></a>
                    </div>
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