<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
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


<div class="btn" id="b1log"><a href="login.jsp">Log In</a>


</div>
<div class="btn long" id="b2"><a href="#">How Does It Work?</a></div>
<div class="btn" id="b3"><a href="pricing.jsp">Pricing</a></div>
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
<h1>Forgotten Password?</h1>
<div class="pcontent">

 <s:if test="hasActionMessages()"><div class="welcome"> <s:actionmessage/></div></s:if>

  <form name="form1" method="post" action="Forget_forgetPassword.action">
    <table width="424" height="75" border="0" align="center" cellpadding="1" cellspacing="1">
      <!-- <tr>
        <td width="234" height="33">Enter User ID</td>
        <td width="174"><input name="userId" type="text"></td>
      </tr> -->
      <tr>
        <td>Enter Email Address </td>
        <td><input type="text" name="emailId"></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><input type="submit" name="Submit" value="Recover Password"></td>
      </tr>
    </table>
    <p>&nbsp;</p>
  </form>
  </div>
</div><!-- information area -->




<div class="fluid info2"></div> 
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


</div> <!-- white content area -->
  
  
</div> <!-- main div containing white and nav-->

<footer id="mainFooter" class="fluid">&copy; 2013 Powered by Bayesoft</footer>
</div>
</body>
</html>
