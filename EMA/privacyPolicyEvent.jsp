<%@page import="org.springframework.context.annotation.Import"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<link href="css_dev/boilerplate_custom.css" rel="stylesheet" type="text/css">
<link href="css_dev/fluid_custom.css" rel="stylesheet" type="text/css">

<link rel="stylesheet" type="text/css" href="_css/jquery-ui.css" />
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script src="_css/respond.min.js"></script>

<script type="text/javascript">

function goOnQuestionnaire(){
	
	if(!document.forms[0].acceptpolicy.checked)
	{
	    alert('Please accept the Policy !');
	    return false;
	}
	
	   document.forms[0].action = "newEventTracker.jsp";
       document.forms[0].submit();
}


</script>

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
  <div class="subscriber"><h3><a href="#">Welcome <%=(String)request.getSession().getAttribute("username") %></a><a href="logout">Log Out</a></h3>
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


    <div class="btn" id="b1log"><a href="myforms">Dashboard</a>


</div>
<div class="btn" id="b2"><a href="#"><!-- Forms --></a></div>
<div class="btn" id="b3"><a href="people"><!-- People --></a></div>
<div class="btn" id="b4"><a href="#"><!-- Data --></a></div>
<div class="btn" id="help"></div>

<div class="btn" id="primary"><a href="#"></a></div>

<div class="hidden logGate">
    <ul class="dropDn">
        <li><a href="#">Patient</a></li>
        <li><a href="#">Doctor</a></li>
    </ul>
</div>

</nav>

<div class="fluid mainCNT home q">  <!-- Large white area - divs to be placed here for content-->
<form name="form1" >
<div class="infoCNT">
<h1>Privacy</h1>
<div class="lcontent">
<h3>SECTION 1 - WHAT DO WE DO WITH YOUR INFORMATION?</h3>
When you purchase something from our store, as part of the buying and selling
process, we collect the personal information you give us such as your name, address
and email address.
When you browse our store, we also automatically receive your computer’s internet
protocol (IP) address in order to provide us with information that helps us learn about
your browser and operating system.
Email marketing (if applicable): With your permission, we may send you emails about
our store, new products and other updates.
<h3>SECTION 2 - CONSENT</h3>
How do you get my consent?
When you provide us with personal information to complete a transaction, verify your
credit card, place an order, arrange for a delivery or return a purchase, we imply that
you consent to our collecting it and using it for that specific reason only.
If we ask for your personal information for a secondary reason, like marketing, we will
either ask you directly for your expressed consent, or provide you with an opportunity to
say no.
How do I withdraw my consent?
If after you opt-in, you change your mind, you may withdrawing your consent for us to
contact you, for the continued collection, use or disclosure of your information, at
anytime, by contacting us at support@bayessoft.com or mailing us at:
clothesline
1311 Chestnut Lane, Davis, California, US, 95616
<h3>SECTION 3 - DISCLOSURE</h3>
We may disclose your personal information if we are required by law to do so or if you
violate our Terms of Service.
<h3>SECTION 4 - Amazon Web Services</h3>
Our store is hosted on Amazon EC2. They provide us with the online e-commerce
platform that allows us to sell our products and services to you.
Your data is stored through Amazon EC2 data storage, databases and the general
365ema.com application. They store your data on a secure server behind a firewall.
Payment:
If you choose a direct payment gateway to complete your purchase, then 365ema.com
stores your credit card data. It is encrypted through the Payment Card Industry Data
Security Standard (PCI-DSS). Your purchase transaction data is stored only as long as
is necessary to complete your purchase transaction. After that is complete, your
purchase transaction information is deleted.
All direct payment gateways adhere to the standards set by PCI-DSS as managed by
the PCI Security Standards Council, which is a joint effort of brands like Visa,
MasterCard, American Express and Discover.
PCI-DSS requirements help ensure the secure handling of credit card information by
our store and its service providers.
For more insight, you may also want to read Bayessoft Terms of Service here or Privacy
Statement here.
<h3>SECTION 5 - THIRD-PARTY SERVICES</h3>
In general, the third-party providers used by us will only collect, use and disclose your
information to the extent necessary to allow them to perform the services they provide
to us.
However, certain third-party service providers, such as payment gateways and other
payment transaction processors, have their own privacy policies in respect to the
information we are required to provide to them for your purchase-related transactions.
For these providers, we recommend that you read their privacy policies so you can
understand the manner in which your personal information will be handled by these
providers.
In particular, remember that certain providers may be located in or have facilities that
are located a different jurisdiction than either you or us. So if you elect to proceed with a
transaction that involves the services of a third-party service provider, then your
information may become subject to the laws of the jurisdiction(s) in which that service
provider or its facilities are located.
As an example, if you are located in Canada and your transaction is processed by a
payment gateway located in the United States, then your personal information used in
completing that transaction may be subject to disclosure under United States legislation,
including the Patriot Act.
Once you leave our store’s website or are redirected to a third-party website or
application, you are no longer governed by this Privacy Policy or our website’s Terms of
Service.
Links
When you click on links on our store, they may direct you away from our site. We are
not responsible for the privacy practices of other sites and encourage you to read their
privacy statements.
Google analytics:
Our store uses Google Analytics to help us learn about who visits our site and what
pages are being looked at.
<h3>SECTION 6 - SECURITY</h3>
To protect your personal information, we take reasonable precautions and follow
industry best practices to make sure it is not inappropriately lost, misused, accessed,
disclosed, altered or destroyed.
If you provide us with your credit card information, the information is encrypted using
secure socket layer technology (SSL) and stored with a AES-256 encryption. Although
no method of transmission over the Internet or electronic storage is 100% secure, we
follow all PCI-DSS requirements and implement additional generally accepted industry
standards.
<h3>SECTION 7 - COOKIES</h3>
Here is a list of cookies that we use. We’ve listed them here so you that you can
choose if you want to opt-out of cookies or not.
_session_id, unique token, sessional, Allows Bayessoft to store information about your
session (referrer, landing page, etc).
Bayessoft, no data held, Persistent for 30 minutes from the last visit, Used by our
website provider’s internal stats tracker to record the number of visits
365ema.com, no data held, expires midnight (relative to the visitor) of the next day,
Counts the number of visits to a store by a single customer.
cart, unique token, persistent for 2 weeks, Stores information about the contents of your
cart.
_secure_session_id, unique token, sessional
storefront_digest, unique token, indefinite If the shop has a password, this is used to
determine if the current visitor has access.
Google analytics:
PREF, persistent for a very short period, Set by Google and tracks who visits the store
and from where
<h3>SECTION 8 - AGE OF CONSENT</h3>
By using this site, you represent that you are at least the age of majority in your state or
province of residence, or that you are the age of majority in your state or province of
residence and you have given us your consent to allow any of your minor dependents to
use this site.
<h3>SECTION 9 - CHANGES TO THIS PRIVACY POLICY</h3>
We reserve the right to modify this privacy policy at any time, so please review it
frequently. Changes and clarifications will take effect immediately upon their posting on
the website. If we make material changes to this policy, we will notify you here that it
has been updated, so that you are aware of what information we collect, how we use it,
and under what circumstances, if any, we use and/or disclose it.
If our store is acquired or merged with another company, your information may be
transferred to the new owners so that we may continue to sell products to you.
<h3>QUESTIONS AND CONTACT INFORMATION</h3>
If you would like to: access, correct, amend or delete any personal information we have
about you, register a complaint, or simply want more information contact our Privacy
Compliance Officer at support@bayessoft.com or by mail at
Bayessoft: <br><br>
Re: Privacy Compliance Officer<br>
1311 Chestnut Lane, Davis, California, US, 95616
<br></br>

<input type="checkbox" name="acceptpolicy"> Please Accept the Policy for going forward.<b>

<input  name="Submit" type="button" class="button" onClick="goOnQuestionnaire()" value="Create EventTracker"> 

</b>
</form>
</div>
</div><!-- information area -->




<div class="fluid info2"></div> 
<!-- info -->

<div class="btmLinks">
<ul class="btmHome">
<li class="first select"><a href="privacy.jsp">Privacy</a></li>
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
