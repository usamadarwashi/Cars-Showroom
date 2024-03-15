<!doctype html>
<html>
<head>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Phoenix Cars/Register</title>
<link href="Styles/screenStyle.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.0/css/fontawesome.min.css" integrity="sha384-z4tVnCr80ZcL0iufVdGQSUzNvJsKjEtqYZjiQrrYKlpGow+btDHDfQWkFjoaz/Zr" crossorigin="anonymous">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
	<script src="https://use.fontawesome.com/0a90250592.js"></script>
	<cfquery name="rng" datasource="Usama190501">
		select * from Range where Active=yes;
	</cfquery>
	<cfquery name="qryreg" datasource="Usama190501">
		select * from Model;
	</cfquery>
    	<script>
	</script>
</head>
<body onLoad="lastmod()">
    
	<section class="header" id="mainpage">
		<nav id="stickynav">
			<a href="Index.cfm"><img src="Images/logo.png"  alt="This is Phoenix Cars logo"></a>
		
			<div class="nav-links" id="navLinks">
				<i class="fa fa-times" onClick="hideMenu()"></i>
				<ul>
					<li><a href="Index.cfm" title="Go to Home page" id="nav-linksSelected">HOME</a></li>
					<cfoutput query="rng">
						<li><a href="Range.cfm?theModel=#rng.Range_ID#" title="Go to #Range_Title# page">#Range_Title#</a></li>
					</cfoutput>
					<li><a href="Query.cfm" title="Go to Query page">QUERY</a></li>
					<li><a href="#contact" title="Go to Contact info">CONTACT US</a></li>
				</ul>
			</div>
			<i class="fa fa-bars" onClick="showMenu()"></i>
			</section>

        <div class="text-box">
			<h1>Client Registration</h1>
			<p>Enter Your Information In the designated Fields downword</p>
           
            </nav>
        </div> 
            <section class="subscribe">
		<br><br>
		<div class="row">
		<div class="contactcol">

			<form method="post">
			<input type="text" name="Fname" placeholder="Enter your FirstName" required>
			<input type="text" name="LName" placeholder="Enter your LastName" required>
			<input type="text" name="phone" placeholder="Enter your phone No." required>
            <input type="text" name="Email" placeholder="Enter your Email" required>
            <input type="text" name="Address" placeholder="Enter your Address" required>
            <input type="text" name="Postcode" placeholder="Enter your Post Code" required>
			<a type="submit" href="Query.cfm" class="main-btn2">Register</a>
			</form>
				</div>
		</div>
	
	</section>
            
              
		
        
    <!-------------------------------------------------------------------------------------->
   
	        
     
	
    
    
		

	<footer>
	<section class="footer">
		<a id="showroom_location"><h1>Our location</h1></a>
		<p><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4346.596227628133!2d58.21810267535214!3d23.638839267360133!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3e8dfc9369db9d95%3A0x57afe2923c208e99!2sNational%20University%20of%20Science%20and%20Technology%20(College%20of%20Engineering%2C%20Caledonian%20Campus)!5e0!3m2!1sen!2som!4v1669181675575!5m2!1sen!2som" width="50%" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></p>
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
	</footer>
    
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
