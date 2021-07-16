  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
  <html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/payment.css">
        <script src="${pageContext.request.contextPath}/resources/js/payment.js"></script>
       <script>
            function myFunction() {
                document.getElementById("GFG").submit();
            }
        </script>
        <script>
            function myFunction1() {
                document.getElementById("GFG").submit();
            }
        </script>
        <title>Payment - SBK</title>
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
                    <li class="pre-profile-1 pt-2 pb-2"><a href="#" onclick="myFunction1()" class="color" style="font-weight:600">Log out</a></li>
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
    
    <div class="container mt-5">
        <div class="row pt-5">
            <div class="col-xl-8 col-lg-12 col-md-12 col-sm-12 col-12 mt-3">
               <div id="accordion">
                  <div class="card">
                      <div class="card-header">
                        <div class="row pt-3">
                          <div class="col-2 text-center">
                            <span style="padding:2% 8%;border:1px solid transparent;background-color: rgb(197, 191, 191);">1</span>
                          </div>
                          <div class="col-6">
                            <span style="font-size:15px;font-weight:600;color:grey;text-transform: uppercase;">delivery address</span>
                            <p><security:authentication property="principal.username"/></p>
                          </div>
                          <div class="col-4 pl-0">
                            <button class="btn btn-primary" data-toggle="collapse" data-target="#collapseOne" id="button-hidder" style='text-transform: uppercase;'>Change</button>
                          </div>
                        </div>
                      </div>
                      
                      
                      <form:form id ="addressIdTakerForm" method = "POST" action = "receipt" modelAttribute ="addressIdTaker" >
                      <div id="collapseOne" class="collapse" data-parent="#accordion">
                        <div class="card-body">
                        
                        <!-- Address For Loop -->
                       
                        
                        
                        <c:forEach var="addressDetail" items="${addressList }">
                        <!-- For Loops Starts -->
                        
                          <div class="row pl-3 ">
                            <div class="col-9 ">
                            <form:radiobutton path="addressId" value="${addressDetail.getAddressId() }"/>
                            
                              <!-- <input type="radio" class="hide-for-front" name="address" checked>&nbsp;&nbsp;&nbsp;&nbsp;<span style="text-transform:uppercase;font-size:15px;">Address Here</span> -->
                            </div>
                            <div class="col-9 ">
                              <class="hide-for-front" name="address" checked>&nbsp;&nbsp;&nbsp;&nbsp;<span style="text-transform:uppercase;font-size:15px;">${addressDetail.getName() }</span>
                            </div>
							<div class="col-9 ">
                              <class="hide-for-front" name="address" checked>&nbsp;&nbsp;&nbsp;&nbsp;<span style="text-transform:uppercase;font-size:15px;">${addressDetail.getAddress() }, ${addressDetail.getLocality() }, ${addressDetail.getCity() }</span>
                            </div>
                            <div class="col-9 ">
                              <class="hide-for-front" name="address" checked>&nbsp;&nbsp;&nbsp;&nbsp;<span style="text-transform:uppercase;font-size:15px;">${addressDetail.getState() } ( PinCode: ${addressDetail.getPinCode() } )</span>
                            </div>
                            <div class="col-9 ">
                              <class="hide-for-front" name="address" checked>&nbsp;&nbsp;&nbsp;&nbsp;<span style="text-transform:uppercase;font-size:15px;">LandMark: ${addressDetail.getLandmark() }</span>
                            </div>
                            <div class="col-9 ">
                              <class="hide-for-front" name="address" checked>&nbsp;&nbsp;&nbsp;&nbsp;<span style="text-transform:uppercase;font-size:15px;">( Mobile Number: ${addressDetail.getMobileNumber() } )</span>
                            </div>
                            <div class="col-9 ">
                              <class="hide-for-front" name="address" checked>&nbsp;&nbsp;&nbsp;&nbsp;<span style="text-transform:uppercase;font-size:15px;">( Alternate Mobile Number: ${addressDetail.getAlternateNumber() } )</span>
                            </div>
                          </div>
                          <br>
                          
                           </c:forEach>
                          
                          <!-- For Loop End -->
                          
                          
                          <div class="row pl-3">
                          <div class="col-6">
                              <a href="${pageContext.request.contextPath}/Protected/updateProfile" class="edit " style="text-transform: uppercase;">Add New Address</a>
                            </div>
                            </div>
                          <br>
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          <div class="row pl-5 hide-for-front">
                            <div class="col">
                              <p><button type='button' style="text-transform: uppercase;padding:2% 5%;background-color: tomato;color:white;border-color:transparent" data-toggle="collapse" data-target="#collapseOne,#collapseTwo" id="button-hidder-1">delivery here</button></p>
                            </div>
                          </div>
						
                      </div>
                  </div>
                  
                  <div class="card">
                    <div class="card-header">
                      <div class="row pt-3 pb-3">
                        <div class="col-2 text-center">
                          <span style="padding:2% 8%;border:1px solid transparent;background-color: rgb(197, 191, 191);">2</span>
                        </div>
                        <div class="col-10">
                          <span style="font-size:15px;font-weight:600;color:grey;text-transform: uppercase;">Order Summary</span>
                        </div>
                      </div>
                    </div>
                    
                   
                    <div id="collapseTwo" class="collapse" >
                      <div class="card-body">
                      
                      
                       <c:forEach var="itemDetail" items="${cartItemsDetails }">
						<div class="row pb-3 ">
                      
                      
                        <div class="col-xl-4 col-lg-2 col-md-3 col-sm-3 col-12 pt-5 text-center">
                          <img src="resources/img/products-image/${itemDetail.getFileName1() }" height="200px">
                        <div class="text-left">
                            
                          </div>
                        </div>
                        <div class="col-xl-8 col-lg-10 col-md-8 col-sm-8 col-12 pt-5">
                          <p>Item Name:&nbsp;${itemDetail.getItemName() }</p>
                          <!-- <p>Seller:&nbsp;Laxmipati</p> -->
                          <p>Price:&nbsp;&#8377;${itemDetail.getPrice() }</p>
                          <p><a href="#" style="font-weight:700">REMOVE</a></p>
                        </div>
                        
                        
                      </div>
                      
                      </c:forEach> 
                      
                        
                        
                        
                        
                        
                        
                        <div class="row">
                          <div class="col pr-5 text-right">
                            <p><button type='button' style="text-transform: uppercase;padding:2% 5%;background-color: tomato;color:white;border-color:transparent" data-toggle="collapse" data-target="#collapseTwo,#payment-option">continue</button></p>
                          </div>
                        </div>
                      </div>
                    </div>
                </div>
                <div class="card">
                  <div class="card-header">
                    <div class="row pt-3 pb-3">
                      <div class="col-2 text-center">
                        <span style="padding:2% 8%;border:1px solid transparent;background-color: rgb(197, 191, 191);">3</span>
                      </div>
                      <div class="col-10">
                        <span style="font-size:15px;font-weight:600;color:grey;text-transform: uppercase;">Payment Options</span>
                      </div>
                    </div>
                  </div>
                  <div class="card-body">
                    <div class="collapse" id="payment-option">
                    <div class="row">
                      <div class="col pl-4 pb-3" id="phone-pe-hidder">
                        <input type="radio" name="payment-method" data-toggle="collapse" data-target="#phonepe">&nbsp;&nbsp;&nbsp;<img src="resources/img/phone-pe.png" style="height:30px;"> PhonePe
                      </div>
                    </div> 
                    <div id="phonepe" class="collapse"> 
                      <div class="row pt-2">
                        <div class="col text-center">
                          <p>You'll be redirected to PhonePe page, where you can pay using UPI, credit/debit card or wallet</p>
                        </div>
                      </div>
                      <div class="row pl-5">
                        <div class="col">
                          <p><button style="text-transform: uppercase;padding:1.5% 7%;background-color: tomato;color:white;border-color:transparent" data-toggle="collapse" data-target="#payment-option">continue</button></p>
                        </div>
                      </div>
                    </div>
                      <div class="row">
                        <div class="col pl-4" id="debit-hidder">
                          <p><input type="radio" name="payment-method" data-toggle="collapse" data-target="#debit">&nbsp;&nbsp;&nbsp;Credit/Debit/ATM Card</p>
                        </div>
                      </div>
                      <div class="collapse" id="debit">
                      <div class="row">
                        <div class="col pl-5">
                          <p><input type="text" placeholder="Enter Card Number" class="pt-2 pb-2 pl-4 card-number">
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-xl-4 col-lg-4 col-md-4  col-sm-6  col-12  pl-5">
                          <p><input type="date" placeholder="DD/MM/YY" class="pt-2 pb-2 pl-2 pr-2 date">
                        </div>
                        <div class="col-xl-2 col-lg-2 col-md-2  col-sm-3  col-12 pl-5 ">
                          <p><input type="text" placeholder="CVV" class="pt-2 pb-2 pl-4 cvv">
                        </div>
                        <div class="col-xl-6 pt-1 pl-5 "> 
                          <p><button style="text-transform: uppercase;padding:1.5% 7%;background-color: tomato;color:white;border-color:transparent" data-toggle="collapse" data-target="#payment-option" >PAY &#8377;1,377</button></p>
                        </div>
                      </div>
                      </div>
                      <div class="row">
                        <div class="col pl-4" id="net-banking-hidder">
                          <p><input type="radio" name="payment-method" data-target="#net-banking" data-toggle="collapse">&nbsp;&nbsp;&nbsp;Net Banking</p>
                        </div>
                      </div>
                      <div class="collapse" id="net-banking">
                      <div class="row pl-4 pr-4">
                        <div class="col-12 pb-2 ">                                                              
                          POPULAR BANKS
                        </div>
                        <div class="col-xl-4 col-lg-4 col-md-6 pt-3">
                          <input type="radio" name="bank">&nbsp;&nbsp;&nbsp;<img src="Images/hdfc-logo.png" style="height:20px">&nbsp;&nbsp;HDFC Bank
                        </div>
                        <div class="col-xl-4 col-lg-4 col-md-6 pt-3">
                          <input type="radio" name="bank">&nbsp;&nbsp;<img src="Images/ici-logo.png" style="height:30px">&nbsp;&nbsp;ICICI Bank
                        </div>
                        <div class="col-xl-4 col-lg-4 col-md-6 pt-3">
                          <input type="radio" name="bank">&nbsp;&nbsp;&nbsp;<img src="Images/state-logo.png" style="height:20px">&nbsp;&nbsp;State Bank Of India
                        </div>
                        <div class="col-xl-4 col-lg-4 col-md-6 pt-3">
                          <input type="radio" name="bank">&nbsp;&nbsp;&nbsp;<img src="Images/axis-logo.jpg" style="height:20px">&nbsp;&nbsp;Axis Bank
                        </div>
                        <div class="col-xl-4 col-lg-4 col-md-6 pt-3">
                          <input type="radio" name="bank">&nbsp;&nbsp;<img src="Images/kotak-logo.jpeg" style="height:30px">&nbsp;&nbsp;Kotak Bank
                        </div>
                        <div class="col-xl-4 col-lg-4 col-md-6 pt-3">
                         <span style="visibility: hidden;">hello user</span>
                        </div>
                      </div>
                      <div class="row pt-3 pl-4"> 
                        <div class="col-12">
                          <span>Other Bank</span>
                        </div>
                        <div class="col-12 pt-3">
                          <input type="text" placeholder="Bank Name" style="width:50%" class="pt-1 pb-1 pl-4">
                        </div>
                        <div class="col-12 pt-4">
                          <p><button style="text-transform: uppercase;padding:1.5% 7%;background-color: grey;color:white;border-color:transparent;font-weight: 600;" data-toggle="collapse" data-target="#payment-option">PAY &#8377;1,377</button></p>
                        </div>
                      </div>
                      </div>
                      <div class="row">
                        <div class="col pl-4" id="cash-hidder">
                          <p><input type="radio" name="payment-method" data-toggle="collapse" data-target="#cash">&nbsp;&nbsp;&nbsp;Cash on Delivery</p>
                            <div class="collapse" id="cash">
                          <p class="pl-3"><a href =""><button style="text-transform: uppercase;padding:1.5% 7%;background-color: grey;color:white;border-color:transparent;font-weight: 600;"  data-toggle="collapse" data-target="#payment-option">confirm</button></a></p>
                              </div>
                        </div>
                      </div> 
              		
                      </div>
                    </div>
                  </div>
                  </form:form> 
              </div>
              </div>  
            </div>
            <div class="col-xl-4 col-lg-12 col-md-12 col-sm-12 col-12 mt-3 pt-4">
              <div class="container">
                <div class="card">
                  <div class="card-header">PRICE DETAILS</div>
                  <div class="card-body">
                    <div class="row">
                      <div class="col text-left">
                      Price(${cartItemsDetails.size() }) :
                      </div>
                      <div class="col text-right">
                        &#8377;${price }
                      </div>
                    </div>
                      <div class="row pt-3">
                        <div class="col-7 text-left ">
                          Delivery Charges :
                        </div>
                        <div class="col text-right">
                          Free
                        </div>
                      </div>
                    <hr>
                    <div class="row">
                      <div class="col text-left">
                        Total Amount :
                      </div>
                      <div class="col text-right">
                        &#8377;${price }
                      </div>
                    </div>
                  </div> 
                </div>
              </div>
            </div>
        </div>

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