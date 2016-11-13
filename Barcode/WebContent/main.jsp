<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Main</title>
<link rel="stylesheet" href="./css2/style.css" type="text/css" charset="utf-8" />
</head>
<body>
<div id="wrapper">

	<div id="logo">
		<h1>Online Booking</h1>
		<p>Drinks and Appetizer</p> 		
	</div>
	
	<div id="nav">
		<div id="nav-left">
			<ul>
		 		<li><a href="#">Home</a></li>
		 		<li class="orange"><a href="#">Contact</a></li>
			</ul>
		</div>
		<div id="nav-right">
			<ul>
				<li><a href="#">About us</a></li>
				<li><a href="#">Menu</a></li>
				<li><a href="#">Services</a></li>
				<li><a href="http://localhost:8080/jforum/forums/list.page">Forum</a></li>
			</ul>
		</div>
	</div><div class="inner_copy"></div>
	<div id="body">
		<div id="left">
			<div id="welcome">
				<h2 class="guilded"><span>Welcome</span></h2>
				<p>This pub was thought to smart people, who plan their happy hour to avoid crowd and get fresh appetizer and drinks</p>
				<p>Using your smart phone, iPad, notebook or desktop you can follow the status of your orders, pub occupation, free tables and seats, and friends inside</p>
				<p>You can watch our fabulous kitchen and chef cooking your order</p>
				<p class="more"><a href="#">more...</a></p>
			</div>
			<div id="chef"	>
				<h2>Kitchen Sterile</h2>
				<p>We have our own way to clean and sterilize flatware, cups, glasses, et cetera</p>
				<p>Check it out through our cameras</p>
				<p>&nbsp;</p>
				<p class="more"><a href="#">more...</a></p>
			</div>
		</div>
		<div id="right">
			<div id="booking">
				<h2>Online booking</h2>
				<form action="" method="get" accept-charset="utf-8">
					<table border="0" cellspacing="2" cellpadding="0">
						<tbody>
							<tr><th>Name</th><td><input type="text" name="a" value="" class="text" /></td></tr>
							<tr><th>Email/Phone</th><td><input type="text" name="b" class="text" value="" /></td></tr>
							<tr><th>Date</th><td><input type="text" name="c" value="" class="text" /></td></tr>
							<tr><th>Members</th><td><input type="text" name="d" value="" class="text" /></td></tr>
							
							<tr><th>Share Table</th>
							<td>
								<select>
								  	<option value="Yes">Yes</option>
	  								<option value="No" selected>No</option>
								</select>
							</td>						
							</tr>
														
							<tr>
								<th>Time</th>
								<td>
									<select name="e">
										 <option value="dinner">Dinner</option>
										 <option value="drinks">Drinks</option>
									</select>
								</td>
							</tr>
							<tr><td class="submission" colspan="2"><input type="submit" name="s" value="Submit" /></td></tr>
						</tbody>
					</table>
				</form>
			</div>
			<div id="menu">
				<h2>How Bar Works</h2>
				<p>Check out how we draw the site's <a href="mecanismo.jsp">mechanism</a>.</p>
				<!-- <form action="" method="get" accept-charset="utf-8">
					<p><input type="submit" value="Details"></input></p>
				</form>-->
			</div>
		</div>
		<div class="clear"></div>
		<div id="footer">
			<ul>
				<li><a href="#">Home</a> | </li>
				<li><a href="#">About Us</a> | </li>
				<li><a href="#">Menu</a> | </li>
				<li><a href="#">Service</a> | </li>
				<li><a href="#">Forum</a> | </li>
				<li><a href="#">Contact</a></li>
			</ul>
			<div class="left"><p>Copyright © Bar Code Netbar </p></div>
			<div class="right"><p><a href="crdits">Credits</a></p></div><div class="clear"></div>
		</div>
	</div>
</div>
</body>
</html>