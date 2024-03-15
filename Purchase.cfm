<cfif not IsDefined("url.theModel")>
  <cflocation url="index.cfm">
</cfif>
<!doctype html>
<html>
<head>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Phoenix Cars/Purchase</title>
<link href="Styles/screenStyle.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.0/css/fontawesome.min.css" integrity="sha384-z4tVnCr80ZcL0iufVdGQSUzNvJsKjEtqYZjiQrrYKlpGow+btDHDfQWkFjoaz/Zr" crossorigin="anonymous">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<script src="https://use.fontawesome.com/0a90250592.js"></script>
	<cfquery name="breadcrumbM" datasource="Usama190501">
		SELECT *
    	FROM Vehicle
    	WHERE Vehicle_ID = '#url.theModel#';
	</cfquery>
	<cfoutput query="breadcrumbM">
		<cfset b_Model_ID_v = #Model_ID#>
		<cfset b_Range_ID_v = #Range_ID#>
	</cfoutput>
	<cfquery name="breadcrumbR" datasource="Usama190501">
		SELECT *
    	FROM Range
    	WHERE Range_ID = '#b_Range_ID_v#';
	</cfquery>
	<cfoutput query="breadcrumbR">
		<cfset b_Range_Title_v = #Range_Title#>
	</cfoutput>
	<cfquery name="rng" datasource="Usama190501">
		select * from Range where Active=yes;
	</cfquery>
	<cfquery name="title" datasource="Usama190501">
		SELECT * FROM Range WHERE Range.Range_ID = '#b_Range_ID_v#';
	</cfquery>
	<cfquery name="link" datasource="Usama190501">
		SELECT * FROM Range, Model WHERE Range.Range_ID = Model.Range_ID AND Range.Range_ID = '#b_Range_ID_v#';
	</cfquery>
	<cfquery name="mdlTitle" datasource="Usama190501">
		select * from Model where Model.Model_ID = '#b_Model_ID_v#';
	</cfquery>
	<cfquery name="vehicles" datasource="Usama190501">
		SELECT * FROM Model, Vehicle WHERE Model.Model_ID = Vehicle.Model_ID AND Model.Model_ID = '#b_Model_ID_v#';
	</cfquery>
	<cfquery name="vehiclesModel" datasource="Usama190501">
		SELECT *
    	FROM Vehicle
    	WHERE Model_ID = '#b_Model_ID_v#';
	</cfquery>
</head>
<body onLoad="lastmod(), initialload()">
	<section class="header" id="mainpage">
		<nav id="stickynav">
			<a href="Index.cfm"><img src="Images/logo.png"  alt="This Phoenix Cars logo"></a>
		
			<div class="nav-links" id="navLinks">
				<i class="fa fa-times" onClick="hideMenu()"></i>
				<ul>
					<li><a href="Index.cfm" title="Go to Home page">HOME</a></li>
					<cfoutput query="rng">
						<cfif b_Range_ID_v eq "#Range_ID#">
							<li><a href="Range.cfm?theModel=#rng.Range_ID#" title="Go to #Range_Title# page" id="nav-linksSelected">#Range_Title#</a></li>
						<cfelse>
							<li><a href="Range.cfm?theModel=#rng.Range_ID#" title="Go to #Range_Title# page">#Range_Title#</a></li>
						</cfif>
					</cfoutput>
					<li><a href="Query.cfm" title="Go to Query page">QUERY</a></li>
					<li><a href="#contact" title="Go to Contact info">CONTACT US</a></li>
				</ul>
			</div>
			<i class="fa fa-bars" onClick="showMenu()"></i>
		</nav>
		<div class="text-box">
			<cfquery name="gg" datasource="Usama190501">
				SELECT *
				FROM Model
				WHERE range_ID = '#b_Range_ID_v#';
			</cfquery>
			<cfoutput query="mdlTitle">
				<h1>#Model_Title#</h1>
				<p>#General_info#</p>
			</cfoutput>
			<cfoutput query="breadcrumbR">
				<h2>OTHER MODELS IN #Range_Title#</h2>
			</cfoutput>
			<cfoutput query="gg">
			<cfif b_Model_ID_v eq "#Model_ID#">
				<a href="Model.cfm?theModel=#Model_ID#" id="selectedbutton">#Model_Title#</a>
			<cfelse>
				<a href="Model.cfm?theModel=#Model_ID#" class="main-btn">#Model_Title#</a>
			</cfif>
			</cfoutput>
			<cfoutput query="mdlTitle">
				<h2>OTHER VEHICLES FROM #Model_Title#</h2>
			</cfoutput>
			<cfoutput query="vehiclesModel">
			<cfif url.theModel eq "#Vehicle_ID#">
				<a href="Vehicle.cfm?theModel=#Vehicle_ID#" id="selectedbutton">#Vehicle_Title#</a>
			<cfelse>
				<a href="Vehicle.cfm?theModel=#Vehicle_ID#" class="main-btn">#Vehicle_Title#</a>
			</cfif>
			</cfoutput>
			<cfoutput query="breadcrumbM">
				<p>Scroll down to finalize your Purchase for #Vehicle_Title#</p>
			</cfoutput>
		</div>
	</section>
	<!--ranges section-->
	<section class="Ranges">
		<cfoutput query="breadcrumbM">
			<h1>You are purchasing #Vehicle_Title#<br>for #Price# OMR</h1>
		</cfoutput>
	</section>
	<section class="purchaseform">
		<div class="rowpurchase">
  			<div class="col-75">
    			<div class="container">
      			<form action="">
					<div class="rowpurchase">
					<div class="col-501">
            			<h3>Vehicle Purchase form</h3>
						<cfoutput query="breadcrumbM">
            			<label for="fname"> Vehicle ID</label>
            			<input type="text" id="vID" name="Vehicle_ID" placeholder="#Vehicle_ID#" value="#Vehicle_ID#" readonly >
						<label for="lname"> Registeration Number</label>
            			<input type="text" id="rNo" name="Registration_Number" placeholder="#Registration_Number#" value="#Registration_Number#" readonly>
            			<label for="email"> Price</label>
            			<input type="text" id="price" name="Price" placeholder="#Price#" value="#Price#" readonly>
						</cfoutput>
						<strong>
							<input type="radio" name="paymentMethod" value="cash" id="cashpay" onchange="showcard();" required> Cash</input>
							<input type="radio" name="paymentMethod" value="card" id="creditcard" onchange="showcard();" required> Credit Card</input>
						</strong>
          			</div>
					<div class="col-501">
            			<h3>Payment Mode</h3>
						<cfoutput query="breadcrumbM">
            			<label for="fname"> No. of Months</label>
            			<input type="number" id="monthno" name="No_Installments" min="1" max="24" placeholder="1-24" pattern="[0-9]+" tabindex="1">
						<label for="lname"> Interest Percentage</label>
            			<input type="text" id="rNo" name="Registration_Number" placeholder="#Registration_Number#" value="#Registration_Number#" readonly>
            			<label for="email"> Final Price</label>
            			<p id="fprice"></p>
						</cfoutput>
						<strong>
							<input type="radio" name="paymentType" value="installments" id="instalm" required> Instalments</input>
							<input type="radio" name="paymentType" value="fullprice" id="fullp" required> Single Payment</input>
						</strong>
          			</div>
					</div>
					<br><br><br>
        			<div class="rowpurchase">
          			<div class="col-50">
            			<h3>Billing Address</h3>
            			<label for="fname"><i class="fa fa-user"></i> First Name</label>
            			<input type="text" id="fname" name="firstname" placeholder="FirstName">
						<label for="lname"><i class="fa fa-user"></i> Last Name</label>
            			<input type="text" id="lname" name="firstname" placeholder="LastName">
            			<label for="email"><i class="fa fa-envelope"></i> Email</label>
            			<input type="text" id="email" name="email" placeholder="abc@example.com">
            			<label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
            			<input type="text" id="adr" name="address" placeholder="Street No.">
            			<label for="city"><i class="fa fa-institution"></i> City</label>
            			<input type="text" id="city" name="city" placeholder="City Name">

            			<div class="rowpurchase">
              			<div class="col-50">
                			<label for="state">State</label>
                			<input type="text" id="state" name="state" placeholder="As Seeb">
              			</div>
              			<div class="col-50">
                			<label for="zip">Zip</label>
                			<input type="text" id="zip" name="zip" placeholder="10001">
              			</div>
            			</div>
          			</div>

          			<div class="col-50">
            			<h3 id="cardheader">Payment</h3>
            			<label for="fname" id="accard">Accepted Cards</label>
            			<div class="icon-container" id="payicons">
              			<i class="fa fa-cc-visa" style="color:navy;"></i>
              			<i class="fa fa-cc-amex" style="color:blue;"></i>
              			<i class="fa fa-cc-mastercard" style="color:red;"></i>
              			<i class="fa fa-cc-discover" style="color:orange;"></i>
            			</div>
            			<label for="cname" id="lcname">Name on Card</label>
            			<input type="text" id="cname" name="cardname" placeholder="Full Name">
            			<label for="ccnum" id="lccnum">Credit card number</label>
            			<input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
            			<label for="expmonth" id="lexpm">Exp Month</label>
            			<input type="text" id="expmonth" name="expmonth" placeholder="Month">

            			<div class="rowpurchase">
              			<div class="col-50">
                			<label for="expyear" id="lexpy">Exp Year</label>
                			<input type="text" id="expyear" name="expyear" placeholder="Year">
              			</div>
              			<div class="col-50">
                			<label for="cvv" id="lcvv">CVV</label>
                			<input type="text" id="cvv" name="cvv" placeholder="CVV">
              			</div>
            			</div>
          			</div>

        			</div>
        			<label>
          			<input type="checkbox" checked="checked" name="sameadr"> Shipping address same as billing
        			</label>
        			<input type="submit" value="Complete Purchase" class="btn">
      			</form>
    			</div>
  			</div>
		</div>
		<br><br><br><br>
	</section>
	<section class="Ranges">
		<a id="showroom_location"><h1>Our location</h1></a>
		<p><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4346.596227628133!2d58.21810267535214!3d23.638839267360133!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3e8dfc9369db9d95%3A0x57afe2923c208e99!2sNational%20University%20of%20Science%20and%20Technology%20(College%20of%20Engineering%2C%20Caledonian%20Campus)!5e0!3m2!1sen!2som!4v1669181675575!5m2!1sen!2som" width="50%" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></p>
	</section>
	<section class="footer">
		<a id="contact"><h4>About Us</h4></a>
		<p class="icons"><i class="fa fa-info"></i>Make sure to contact us through this contact info, you're always welcomed!</p>
			<div class="footer-col">
				<div class="icons"><i class="fa fa-phone"></i>Phone: +968 99076773 </div><div class="icons"><i class="fa fa-map-marker"></i>Al Hail South, As Seeb, Muscat, Sultanate of Oman</div>
				<div class="icons"><i class="fa fa-envelope"></i>Email: Usama190501@nu.edu.om </div><div class="icons"><i class="fa fa-fax"></i>Fax: 522315</div>
			</div>
		<div class="icons">
			<i class="fa fa-facebook"></i>
			<i class="fa fa-twitter"></i>
			<i class="fa fa-instagram"></i>
			<i class="fa fa-linkedin"></i>
		</div>
		<p id="sudo"></p>
	</section>
	<!--menu toggle on/off-->
	<script>
		var navLinks = document.getElementById("navLinks");
		function showMenu()
		{
			navLinks.style.right = "0";
		}
		function hideMenu()
		{
			navLinks.style.right = "-200px";
		}
	</script>
	<!--Last modified date-->
	<script>
		function lastmod()
		{
			var x = document.lastModified;
			document.getElementById("sudo").innerHTML = x;
		}
	</script>
	<script>
		let navbar = document.getElementById("stickynav");
		let mainpage = document.getElementById("mainpage");
		let navpos = navbar.getBoundingClientRect().top;
		window.addEventListener("scroll", e => {
			scrollpos = window.scrollY;
		});
		window.addEventListener("scroll", e => {
			let viewportHeight = window.innerHeight;
			let scrollpos = window.scrollY;
			if (scrollpos > navpos) {
				navbar.classList.add('sticky');
			} else {
				navbar.classList.remove('sticky');
			}
		});
	</script>
	<script>
		function initialload()
		{
			var radiobtn = document.getElementById("cashpay");
			var in1 = document.getElementById("cname");
			var in2 = document.getElementById("ccnum");
			var in3 = document.getElementById("expmonth");
			var in4 = document.getElementById("expyear");
			var in5 = document.getElementById("cvv");
			var in6 = document.getElementById("lcvv");
			var in7 = document.getElementById("lccnum");
			var in8 = document.getElementById("lcname");
			var in9 = document.getElementById("lexpm");
			var in10 = document.getElementById("lexpy");
			var in11 = document.getElementById("cardheader");
			var in12 = document.getElementById("accard");
			var in13 = document.getElementById("payicons");
			
					in1.style.display = "none";
					in2.style.display = "none";
					in3.style.display = "none";
					in4.style.display = "none";
					in5.style.display = "none";
					in6.style.display = "none";
					in7.style.display = "none";
					in8.style.display = "none";
					in9.style.display = "none";
					in10.style.display = "none";
					in11.style.display = "none";
					in12.style.display = "none";
					in13.style.display = "none";
		}
		function showcard()
		{
			var radiobtn = document.getElementById("cashpay");
			var in1 = document.getElementById("cname");
			var in2 = document.getElementById("ccnum");
			var in3 = document.getElementById("expmonth");
			var in4 = document.getElementById("expyear");
			var in5 = document.getElementById("cvv");
			var in6 = document.getElementById("lcvv");
			var in7 = document.getElementById("lccnum");
			var in8 = document.getElementById("lcname");
			var in9 = document.getElementById("lexpm");
			var in10 = document.getElementById("lexpy");
			var in11 = document.getElementById("cardheader");
			var in12 = document.getElementById("accard");
			var in13 = document.getElementById("payicons");
			
			
			if (radiobtn.checked == 1)
				{
					in1.style.display = "none";
					in2.style.display = "none";
					in3.style.display = "none";
					in4.style.display = "none";
					in5.style.display = "none";
					in6.style.display = "none";
					in7.style.display = "none";
					in8.style.display = "none";
					in9.style.display = "none";
					in10.style.display = "none";
					in11.style.display = "none";
					in12.style.display = "none";
					in13.style.display = "none";
				}
			else
				{
					in1.style.display = "block";
					in2.style.display = "block";
					in3.style.display = "block";
					in4.style.display = "block";
					in5.style.display = "block";
					in6.style.display = "block";
					in7.style.display = "block";
					in8.style.display = "block";
					in9.style.display = "block";
					in10.style.display = "block";
					in11.style.display = "block";
					in12.style.display = "block";
					in13.style.display = "block";
				}
		}
	</script>
	<script>
		function intcalc()
		{
			const vehicleprc = document.getElementById("price").value;
			const installNo = document.getElementById("monthno").value;
			var intNo;
			
			if (installNo <= 12 && installNo >= 1){
				intNo = vehicleprc + vehicleprc * 0.025;
			}
			 else if (installNo > 12 && installNo <= 24)
				 {
					 intNo = vehicleprc + vehicleprc * 0.039;
				 }
			else {
				intNo = vehicleprc * 1;
			}
			
			document.getElementById("fprice").value = `$${intNo.toFixed(3)}`;
		}
	</script>
</body>
</html>
