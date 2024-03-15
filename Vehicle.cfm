<cfif not IsDefined("url.theModel")>
  <cflocation url="index.cfm">
</cfif>
<!doctype html>
<html>
<head>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Phoenix Cars/Vehicle</title>
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
<body onLoad="lastmod()">
	<section class="header" id="mainpage">
		<nav id="stickynav">
			<a href="Index.cfm"><img src="Images/logo.png" alt="This is Phoenix Cars logo"></a>
			
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
				<p>Scroll down for more about #Vehicle_Title#</p>
			</cfoutput>
		</div>
	</section>
	<!--ranges section-->
	<section class="Ranges">
	<div class="bigimgcol">
		<cfquery name="bigimg" datasource="Usama190501">
			select * from BigImages where Vehicle_ID = '#url.theModel#';
		</cfquery>
		<cfoutput query="bigimg">
		<img src="#URL#" id="bigImage">
		<div class="bigimglayer">
			<h1></h1>
		</div>
		</cfoutput>
	</div>
		<cfoutput query="breadcrumbM">
			<h1>You have chosen #Vehicle_Title#<br>Price: #Price# OMR</h1>
		</cfoutput>
		<div class="row">
			<div class="about-col">
			<cfoutput query="breadcrumbM">
				<img src="Images/Desc.png">
				<h3>#Vehicle_Title#</h3>
                <p>#Vehicle_Heading#</p>
				
			</cfoutput>
			</div>
			<div class="about-col">
			<cfoutput query="breadcrumbM">
				<img src="Images/Details.png">
				<h3>Details of #Vehicle_Title#</h3>
				<p>Price: #Price# OMR<br>Engine Capacity: #Engine_Capacity#<br>Colour: #Colour#<br>Registeration No.#Registration_Number# date: #Registration_Date#<br>Mileage: #Mileage# KM<br>Fuel: #Fuel_Type#, #Fuel_Consumption#</p>
			</cfoutput>
			</div>
		</div>
		<cfoutput query="breadcrumbM">
		<a href="Purchase.cfm?theModel=#breadcrumbM.Vehicle_ID#" class="main-btn">Purchase</a>
		</cfoutput>
		<br><br><br><br>
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
</body>
</html>
