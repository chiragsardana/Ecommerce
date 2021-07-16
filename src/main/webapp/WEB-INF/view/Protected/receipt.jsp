  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<link rel="stylesheet" href="resources/css/receipt.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>

<script>
    function demoFromHTML() {
        var pdf = new jsPDF('p', 'pt', 'letter');
        // source can be HTML-formatted string, or a reference
        // to an actual DOM element from which the text will be scraped.
        source = $('#content')[0];

        // we support special element handlers. Register them with jQuery-style 
        // ID selector for either ID or node name. ("#iAmID", "div", "span" etc.)
        // There is no support for any other type of selectors 
        // (class, of compound) at this time.
        specialElementHandlers = {
            // element with id of "bypass" - jQuery style selector
            '#bypassme': function (element, renderer) {
                // true = "handled elsewhere, bypass text extraction"
                return true
            }
        };
        margins = {
            top: 0,
            bottom: -10,
            left: 20,
            width: 2500 
        };
        // all coords and widths are in jsPDF instance's declared units
        // 'inches' in this case
        pdf.fromHTML(
            source, // HTML string or DOM elem ref.
            margins.left, // x coord
            margins.top, { // y coord
                'width': margins.width, // max width of content on PDF
                'elementHandlers': specialElementHandlers
            },

            function (dispose) {
                // dispose: object with X, Y of the last line add to the PDF 
                //          this allow the insertion of new lines after html
                pdf.save('Test.pdf');
            }, margins
        );
    }
</script>

<title>Receipt - SBK</title>
</head>
<body>

 <div class="offset-xl-2 col-xl-8 col-lg-12 col-md-12 col-sm-12 col-12 padding">
     <div id="content" class="card">
         <div class="card-header p-4">
             <a class="pt-2 d-inline-block" href="${pageContext.request.contextPath}" data-abc="true"><img src="resources/img/shopping-logo.png" height="130px" class="color logo-1 logo-sift"></a>
             <div class="float-right">
                 <h3 class="mb-0">Invoice ${orderId }</h3>
             </div>
         </div>
         <div class="card-body">
             <div class="row mb-4">
                 <div class="col-sm-6">
                     <h5 class="mb-3">From:</h5>
                     <h3 class="text-dark mb-1">SBK</h3>
                     <div>Sirsa</div>
                     <div>Haryana (125055)</div>
                     <div>Email: contact@SBK.com</div>
                     <div>Phone: +91 8684 076 590</div>
                 </div>
                 <div class="col-sm-6 ">
                     <h5 class="mb-3">To:</h5>
                     <h3 class="text-dark mb-1">${addressDetails.getName() }</h3>
                     <div>${addressDetails.getAddress() }</div>
                     <div>${addressDetails.getCity() }, ${addressDetails.getState() }</div>
                     <div>Email: ${userDetails.getEmailId() }</div>
                     <div>Phone: ${addressDetails.getMobileNumber() }</div>
                 </div>
             </div>
             <div class="table-responsive-sm">
                 <table class="table table-striped">
                     <thead>
                         <tr>
                             <th class="center">#</th>
                             <th>Item</th>
                     <!--         <th>Description</th> -->
                             <th class="right">Price</th>
                            <!--  <th class="center">Qty</th> -->
                             <th class="right">Total</th>
                         </tr>
                     </thead>
                     
                     
                     <tbody>
                     
                     
                     <c:forEach var="itemDetail" items="${cartItemsDetails }">
                         <tr>
                             <td class="center">${itemDetail.getItemId() }</td>
                             <td class="left strong">${itemDetail.getItemName() }</td>
                             <td class="right">&#8377; ${itemDetail.getPrice() }</td>
                             
                             <td class="right">&#8377; ${itemDetail.getPrice() }</td>
                         </tr>
                     </c:forEach> 
                     
                     
                     
                     
                     
                     </tbody>
                     
                     
                     
                     
                 </table>
             </div>
             <div class="row">
                 <div class="col-lg-4 col-sm-5">
                 </div>
                 <div class="col-lg-4 col-sm-5 ml-auto">
                     <table class="table table-clear">
                         <tbody>
                             <tr>
                                 <td class="left">
                                     <strong class="text-dark">Subtotal</strong>
                                 </td>
                                 <td class="right">&#8377; ${price }</td>
                             </tr>
                         </tbody>
                     </table>
                 </div>
             </div>
         </div>
         <div class="card-footer bg-white">
             <p class="mb-0">SBK <a href="javascript:demoFromHTML()" class="button">Download Your Receipt!</a></p>
         </div>
     </div>
 </div>

</body>
</html>