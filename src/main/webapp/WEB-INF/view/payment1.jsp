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
        <link rel="stylesheet" href="resources/css/payment.css">
        <script src="resources/js/payment.js"></script>
    	<title>Payment - SBK</title>
    </head>
    <body>
       <!--header part start-->                
       <div class="container-fluid text-white" id="change-color">
        <div class="row" id="top-containt">
          <div class="col-4 text-center">
            <a href="login-ecommerce.html"><img src="Images/shopping-logo.png" height="130px" class="color logo-1 logo-sift"></a>
            <div class="small-devices-logo"><a href="login-ecommerce.html"><img src="Images/pinterest_icon.png" height="70px" class=" color logo-2 mt-1 ml-2"></a></div>
          </div>
          <div class="col-8 pt-4 mt-1 text-center">
            <span class="dropdown dropdown-toggle profile" data-toggle="dropdown" style="color:black" >
              <a href="#/"><img src="Images/profile-icon.png" class="profile-icon color"></a>
            </span>
            <ul class="dropdown-menu mt-4 text-center" style="margin-left:-6%;border-radius:10px;">
              <li class="pre-profile-1 pt-2 pb-2"><a href="#/" class="color" style="font-weight:600">Help Center </a></li>
              <li class="pre-profile-1 pt-2 pb-2"><a href="#/" class="color" style="font-weight:600">Order History</a></li>
              <li class="pre-profile-1 pt-2 pb-2"><a href="#/" class="color" style="font-weight:600">Change Password</a></li>
              <li class="pre-profile-1 pt-2 pb-2"><a href="#/" class="color" style="font-weight:600">Update Profile</a></li>
              <li class="pre-profile-1 pt-2 pb-2"><a href="ecommerce.html" class="color" style="font-weight:600">Log In</a></li>
            </ul>
            <span class="menu-1"><a href="login-ecommerce.html" class="color">home</a></span>
            <span class="menu"><a href="Logged_in_product_page.html" class="color">products</a></span>
            <span class="menu"><a href="logged_in_about_us.html" class="color">about</a></span>
            <span class="menu"><a href="contact-form.html" class="color">contact</a></span>
            <span class="menu-bar text-right"><a href="#/" class="color">&#9776;</a></span>
            <span class="menu-bar-1 text-right"><a href="#/" class="color">&#9776;</a></span>
            <span class="menu-bar-2 text-right"><a href="#/" class="color">&#9776;</a></span>
          </div>
        </div>
        <div class="container-fluid side-bar px-0">
          <div class="col-12 text-right bg-danger"> 
            <span class="close"><a href="#/" class="color">&times;</a></span>
          </div>
            <ul class="pt-5 pre-side-bar">
              <li class="pt-4" style="margin-left:-5%;"><a href="login-ecomarce.html" class="color">home</a></li>
              <li class="pt-3"style="margin-left:-5%"><a href="Logged_in_product_page.html" class="color">products</a></li>
              <li class="pt-3"style="margin-left:-5%"><a href="logged_in_about_us.html" class="color">about</a></li>
              <li class="pt-3"style="margin-left:-5%"><a href="contact-form.html" class="color">contact</a></li>
              <li class="pt-3"style="margin-left:-5%"><a href="#/" class="color">Update profile</a></li>
              <li class="pt-3"style="margin-left:-5%"><a href="ecomarce.html" class="color">Log In</a><span><a href="#" class="color"><img src="log-in..png" class="log-in"></a></span></li>
            </ul>
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
                            <p>user address</p>
                          </div>
                          <div class="col-4 pl-0">
                            <button class="btn btn-primary" data-toggle="collapse" data-target="#collapseOne" id="button-hidder" style='text-transform: uppercase;'>Change</button>
                          </div>
                        </div>
                      </div>
                      <div id="collapseOne" class="collapse" data-parent="#accordion">
                        <div class="card-body">
                          <div class="row pl-3 ">
                            <div class="col-6 ">
                              <input type="radio" class="hide-for-front" name="address" checked>&nbsp;&nbsp;&nbsp;&nbsp;<span style="text-transform:uppercase;font-size:15px;">username</span>
                            </div>
                            <div class="col-6 text-right pr-5">
                              <a href="#/" class="edit hide-for-front" style="text-transform: uppercase;">edit</a>
                            </div>
                          </div>
                          <div class="row pl-5 pb-3 hide-for-front"> 
                            <div class="col">
                              <span style="text-transform: uppercase;"></span>user address</span>
                            </div>
                          </div>
                          <div class="row pl-5 hide-for-front">
                            <div class="col">
                              <p><button style="text-transform: uppercase;padding:2% 5%;background-color: tomato;color:white;border-color:transparent" data-toggle="collapse" data-target="#collapseOne,#collapseTwo" id="button-hidder-1">delivery here</button></p>
                            </div>
                          </div>
                          <div class="container show-for-front">
                            <div class="row pl-3 ">
                              <input type="radio" checked>&nbsp;&nbsp;&nbsp;&nbsp;<span style="text-transform:uppercase;font-size:15px;">EDIT ADDRESS</span>
                            </div>
                            <div class="row pl-5 pt-3 pb-3 ">
                              <button class="btn-primary text-white pl-4 pr-4 pt-2 pb-2" style="border-radius:10px;">Use my current location</button>
                            </div>
                            <div class="row pb-3">
                              <div class="col-6 text-right pr-0">
                                <input type="text" placeholder="NAME" style="width:90%;height:50px;" class="pl-3">
                              </div>
                              <div class="col-6">
                                <input type="text" placeholder="10-digit mobile number" style="width:90%;height:50px;" class="pl-3">
                              </div>
                            </div>
                            <div class="row pr-0 pb-3">
                              <div class="col-6 text-right pr-0">
                                <input type="text" placeholder="Pincode" style="width:90%;height:50px;" class="pl-3">
                              </div>
                              <div class="col-6">
                                <input type="text" placeholder="Locality" style="width:90%;height:50px;" class="pl-3">
                              </div>
                            </div>
                            <div class="row pb-3" style="padding-left:4.7%">
                              <div class="col">
                                <input type="text" placeholder="Address (Area and  Street)" style="width:95%;height:50px;" class="pl-3">
                              </div>
                            </div>
                            <div class="row pb-3">
                              <div class="col-6 text-right pr-0">
                                <input type="text" placeholder="City/District/Town" style="width:90%;height:50px;" class="pl-3">
                              </div>
                              <div class="col-6">
                                <input type="text" placeholder="State" style="width:90%;height:50px;" class="pl-3">
                              </div>
                            </div>
                            <div class="row pr-0 pb-3">
                              <div class="col-6 text-right pr-0">
                                <input type="text" placeholder="Landmark (optional)" style="width:90%;height:50px;" class="pl-3">
                              </div>
                              <div class="col-6">
                                <input type="text" placeholder="Alternate Phone (Optional)" style="width:90%;height:50px;" class="pl-3">
                              </div>
                            </div>
                            <div class="row pl-5">
                              <button class="btn-primary text-white pl-4 pr-4 pt-2 pb-2" style="border-radius:10px;text-transform: uppercase;font-weight: 600;">save and deliver here</button>
                              &nbsp;&nbsp;&nbsp;<span class="pt-2 call-back"><a href="#/" style="text-transform: uppercase;">cancle</a></span>
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
                        <div class="row pb-3 ">
                          <div class="col-xl-4 col-lg-2 col-md-3 col-sm-3 col-12 pt-5 text-center">
                            <img src="Images/men.jpg" height="200px">
                            <div class="text-left">
                              <select name="Qunatity" class="custom-select mt-2 first">
                                <option selected>1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                              </select>
                            </div>
                          </div>
                          <div class="col-xl-8 col-lg-10 col-md-8 col-sm-8 col-8 pt-5">
                            <p>Item Name:&nbsp;Pink Saree</p>
                            <p>Seller:&nbsp;Laxmipati</p>
                            <p>Price:&nbsp;&#8377;390</p>
                            <p><a href="#/" style="font-weight:700">REMOVE</a></p>
                          </div>
                        </div>
                        <div class="row pb-3">
                          <div class="col-xl-4  col-lg-2 col-md-3 col-sm-4 col-12 pt-5 text-center">
                            <img src="Images/girl.jpg" height="200px">
                            <div class="text-left">
                              <select name="Qunatity" class="custom-select mt-2 second">
                                <option selected>1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                              </select>
                            </div>
                          </div>
                          <div class="col-xl-8 col-lg-10 col-md-8 col-sm-8 col-12 pt-5 pt-5">
                            <p>Item Name:&nbsp;Tradesional Dress</p>
                            <p>Size:&nbsp;XXL</p>
                            <p>Seller:&nbsp;Fabindia</p>
                            <p>Price:&nbsp;&#8377;490</p>
                            <p><a href="#/"  style="font-weight:700">REMOVE</a></p>
                          </div>
                        </div>
                        <div class="row pb-3">
                          <div class="col-xl-4 col-lg-2 col-md-3 col-sm-3 col-12 pt-5 pl-5 text-center">
                            <img src="Images/background-image-1.jpg" height="200px">
                            <select name="Qunatity" class="custom-select mt-2 third text-center">
                              <option selected>1</option>
                              <option value="2">2</option>
                              <option value="3">3</option>
                              <option value="4">4</option>
                              <option value="5">5</option>
                              <option value="6">6</option>
                              <option value="7">7</option>
                              <option value="8">8</option>
                              <option value="9">9</option>
                              <option value="10">10</option>
                            </select>
                          
                          
                          </div>
                          <div class="col-xl-8  col-lg-9 col-md-8 col-sm-8 col-8 pt-5 pt-5 pt-5">
                            <p>Item Name:&nbsp;Black Design Saree</p>
                            <p>Seller:&nbsp;Fabindia</p>
                            <p>Price:&nbsp;&#8377;580</p>
                            <p><a href="#/"  style="font-weight:700">REMOVE</a></p>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col pr-5 text-right">
                            <p><button style="text-transform: uppercase;padding:2% 5%;background-color: tomato;color:white;border-color:transparent" data-toggle="collapse" data-target="#collapseTwo,#payment-option">continue</button></p>
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
                        <input type="radio" name="payment-method" data-toggle="collapse" data-target="#phonepe">&nbsp;&nbsp;&nbsp;<img src="Images/phone-pe.png" style="height:30px;"> PhonePe
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
                          <p class="pl-3"><button style="text-transform: uppercase;padding:1.5% 7%;background-color: grey;color:white;border-color:transparent;font-weight: 600;"  data-toggle="collapse" data-target="#payment-option">confirm</button></p>
                              </div>
                        </div>
                      </div> 
                      </div>
                    </div>
                  </div>
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
                        Price(3) :
                      </div>
                      <div class="col text-right">
                        &#8377;1,460
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
                        &#8377;1,460
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


               <a href="?mylocale=fr"> <p style="margin-top:-3%;margin-left:1%;"data-aos="fade-up">Canada - Fran�ais</p></a>
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
                <p><a href="#/" style="color:white">� 2021 Copyright:</a><span style="font-weight:600;"><a href="#/" style="color:white">SBK</a></span></p></a>
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