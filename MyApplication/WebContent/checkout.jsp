<!DOCTYPE html>
<%@page import="db.DbManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en" style="-webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%;">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<!-- Scroll to top on reload -->
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
				function hideURLbar(){ window.scrollTo(0,1); } </script>
		
		<link href="css/checkout.css" rel="stylesheet" type="text/css" media="all" />
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="https://fonts.googleapis.com/css?family=Lato:100,300,300i,400" rel="stylesheet">  
		<title>Baby On Board | Check Out</title>
    </head>
    
    <body>
    
	    <!-- Login Validation -->
	    <script type="text/javascript">
	    	var loginStatus;
		    var loginStatus = <%=session.getAttribute("loginStatus")%>;
		    var contextPath = "<%=request.getContextPath()%>";
		    
		    // Proceed to logout if user not logged in
		    if(loginStatus != true){
		    	var logout_url =  window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + contextPath + "/logout";
				window.location.href = logout_url;
		    }
		    
		    // Get customer details from session
		    var user = <%=session.getAttribute("customerDetails")%>;
	    </script>
	    
		<!-- Database Connection -->
		<%
			DbManager db = new DbManager();
			Connection conn = (Connection) db.getConnection();
		%>
		
		<script type="text/javascript">
			var subscriptionId = <%=request.getParameter("sub")%>;
			var ageGroupId = <%=request.getParameter("age")%>;
			var duration = <%=request.getParameter("dur")%>;
			
			if(subscriptionId == null || ageGroupId == null || duration == null){
				var logout_url =  window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + contextPath + "/logout";
				window.location.href = logout_url;
			}
		</script>
	
		<!--HEADER SECTION -->
        <div class="header">
            <a id="logo-link" href="/index"> <img src="images/baby.png" alt="logo" class="logo"> </a>
            <ul class="main-nav">
	            <li><a href="#features">Features</a></li>
	            <li><a href="#work">How it works</a></li>
	            <li><a href="#contact">Contact</a></li>
	            <li><button id="user-button" class="user hide"><i class="fa fa-user-circle-o" style="font-size:30px;color:#fff;"></i>
	             <div class = "user_dropdown ">
						<ul class="dropdown_nav" >
							<li><a href="/userProfile" id="user_profile">User profile</a></li>
							<li><a href="/transactionHistory" id="transaction">Transaction history</a></li>
							<li><a href="/logout" id="logout_button">Logout</a></li>
						</ul>
						</div>
	            
	            </button></li>
            </ul>
        </div>
        
		<div class="cart-payment-container">
			<div class="heading"><h2>Cart Details</h2></div>
			<div id="cart-container">
			</div>
			
			</br>
			<div class="content">
				<div class="sap_tabs">
					<div id="horizontalTab"
						style="display: block; width: 100%; margin: 0px;">
						<div class="pay-tabs">
							<h2>Select Payment Method</h2>
							<ul class="resp-tabs-list">
								<li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span class="wh-sp-no"><label
										class="pic1"></label>Credit Card</span></li>
								<li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span class="wh-sp-no"><label
										class="pic3"></label>Cash On Delivery</span></li>
								<li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span class="wh-sp-no"><label
										class="pic4"></label>PayPal</span></li>
								<div class="clear"></div>
							</ul>
						</div>
						<div class="resp-tabs-container">
							<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
								<div class="payment-info">
									<h3>Personal Information</h3>
									<form>
										<div class="tab-for">
											<h5>EMAIL ADDRESS</h5>
											<input type="text" value="">
											<h5>FIRST NAME</h5>
											<input type="text" value="">
										</div>
									</form>
									<h3 class="pay-title">Credit Card Info</h3>
									<form>
										<div class="tab-for">
											<h5>NAME ON CARD</h5>
											<input type="text" value="">
											<h5>CARD NUMBER</h5>
											<input class="pay-logo" type="text"
												value="0000-0000-0000-0000" onfocus="this.value = '';"
												onblur="if (this.value == '') {this.value = '0000-0000-0000-0000';}"
												required="">
										</div>
										<div class="transaction">
											<div class="tab-form-left user-form">
												<h5>EXPIRATION</h5>
												<ul>
													<li><input type="number" class="text_box" type="text"
														value="6" min="1" /></li>
													<li><input type="number" class="text_box" type="text"
														value="1988" min="1" /></li>

												</ul>
											</div>
											<div class="tab-form-right user-form-rt">
												<h5>CVV NUMBER</h5>
												<input type="text" value="xxxx" onfocus="this.value = '';"
													onblur="if (this.value == '') {this.value = 'xxxx';}"
													required="">
											</div>
											<div class="clear"></div>
										</div>
										<a class="submit-payment pointer">Continue</a>
									</form>
									<div class="single-bottom">
										<ul class="ma-to-10">
											<li><input type="checkbox" id="brand" value="">
												<label for="brand"><span></span>By checking this
													box, I agree to the Terms & Conditions & Privacy Policy.</label></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
								<div class="payment-info">
									<h3>Cash On Delivery</h3>
									<div class="radio-btns">
										<div class="swit">
											<!--Display Address from database -->
										</div>
										<div class="clear"></div>
									</div>
									<a class="submit-payment pointer">Continue</a>
								</div>
							</div>
							<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-2">
								<div class="payment-info">
									<h3>PayPal</h3>
									<h4>Already Have A PayPal Account?</h4>
									<div class="login-tab">
										<div class="user-login">
											<h2>Login</h2>

											<form>
												<input type="text" value="name@email.com"
													onfocus="this.value = '';"
													onblur="if (this.value == '') {this.value = 'name@email.com';}"
													required=""> <input type="password"
													value="PASSWORD" onfocus="this.value = '';"
													onblur="if (this.value == '') {this.value = 'PASSWORD';}"
													required="">
												<div class="user-grids">
													<div class="user-left">
														<div class="single-bottom">
															<ul>
																<li><input type="checkbox" id="brand1" value="">
																	<label for="brand1"><span></span>Remember me?</label></li>
															</ul>
														</div>
													</div>
													<div class="user-right disabled">
														<input type="submit" value="LOGIN">
													</div>
													<div class="clear"></div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/easyResponsiveTabs.js"></script>
		<script type="text/javascript" src="js/checkout.js"></script>
	</body>
</html>
