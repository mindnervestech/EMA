<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<!--[if lt IE 7]> <html class="ie6 oldie"> <![endif]-->
<!--[if IE 7]>    <html class="ie7 oldie"> <![endif]-->
<!--[if IE 8]>    <html class="ie8 oldie"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="">
<!--<![endif]-->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>365EMA</title>
<link href="_css/boilerplate.css" rel="stylesheet" type="text/css">
<link href="_css/fluid.css" rel="stylesheet" type="text/css">
<!-- 
To learn more about the conditional comments around the html tags at the top of the file:
paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/

Do the following if you're using your customized build of modernizr (http://www.modernizr.com/):
* insert the link to your js here
* remove the link below to the html5shiv
* add the "no-js" class to the html tags at the top
* you can also remove the link to respond.min.js if you included the MQ Polyfill in your modernizr build 
-->
<!--[if lt IE 9]>
<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

<script src="_css/respond.min.js"></script>
</head>


<body>
<div class="gridContainer clearfix">

  <header class="fluid hdr"> <img src="_images/logo.png"  border="0" alt="365EMA - logo"/>
  <div class="subscriber">
  
  </div>
  
  
  <div class="sicons">
  <a href="#"><img  src="_images/SocIcon.png"></a>
  <a href="#"><img src="_images/twitter.png"></a>
  <a href="#"><img src="_images/l-in.png"></a>
  </div>

  </header>
  <div class="fluid main"> <!-- main div to keep navigation and content aligned-->
    
    <nav class="fluid mainNv"> <!-- main navigation buttons-->


<div class="btn" id="b1log"><a href="login.jsp">Log In</a></div>
<div class="btn long" id="b2"><a href="#">How Does It Work?</a></div>
<div class="btn select" id="b3"><a href="pricing.jsp">Pricing</a></div>
<div class="btn" id="help"></div>

<div class="btn" id="primary"><a href="#">Register</a></div>

<div class="hidden logGate">
    <ul class="dropDn">
        <li><a href="#">Patient</a></li>
        <li><a href="#">Doctor</a></li>
    </ul>
</div>

</nav>

<div class="fluid mainCNT home q">  <!-- Large white area - divs to be placed here for content-->
<div class="infoCNT">
<h1>A plan for every budget...</h1>


<div class="price" id="basic">
<div class="bxSpc">
<h1>Basic</h1>
<h3>Free plan for the social user
</h3>
<ul>
<li>100 responses/surveys</li>
<li>Create surveys and polls with a user friendly UI</li>
<li>Optimized for mobile and web based browsers</li>
<li>Iphone native application for your response side</li>
</ul>
</div>
</div>
<div class="price" id="bronze">
<div class="bxSpc">
<h1>Bronze</h1>
<h3>Those who need a little extra
</h3>
<ul>
<li>Basic plan PLUS</li>
<li>Unlimited surveys/responses</li>
<li>Customize with your branding logo</li>
<li>Email distribution</li>
<li>Import CSV contacts</li>
<li>Real-time data delivery</li>
<li>Real-time response with event tracking</li>
<li>Email support</li>

</ul>

</div>

</div>
<div class="price" id="silver">
<div class="bxSpc">
<h1>Silver</h1>
<h3>Company <br>geared service
</h3>
<ul>
<li>Basic plan PLUS</li>
<li>Unlimited surveys/responses</li>
<li>Customize with your branding logo</li>
<li>Email distribution</li>
<li>Import CSV contacts</li>
<li>Real-time data delivery</li>
<li>Real-time response with event tracking</li>
<li>Email support</li>

</ul>
</div>

</div>
<div class="price last" id="gold">
<div class="bxSpc">
<h1>Gold</h1>
<h3>Our Premium Consulting Plan
</h3>
<ul>
<li>Basic plan PLUS</li>
<li>Unlimited surveys/responses</li>
<li>Customize with your branding logo</li>
<li>Email distribution</li>
<li>Import CSV contacts</li>
<li>Real-time data delivery</li>
<li>Real-time response with event tracking</li>
<li>Email support</li>

</ul>
</div>
</div>

</div>
<!-- information area -->




<div class="fluid info2">
<!-- info -->

<div class="btmLinks">
<ul class="btmHome">
<li class="first"><a href="privacy.jsp">Privacy</a></li>
<li><a href="terms.jsp">Terms</a></li>
<li><a href="#">About Us</a></li>
<!--<li><a href="#">Blog</a></li>-->
<li class="last"><a href="#">Contact Us</a></li>
</ul>
</div>
</div> 

</div> <!-- white content area -->
  
  
</div> <!-- main div containing white and nav-->

<footer id="mainFooter" class="fluid">&copy; 2013 Powered by Bayesoft</footer>
</div>
</body>
</html>

