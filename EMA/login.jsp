 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('#primary').click(function(){         
            $( ".reg-list" ).slideToggle( "fast" );
        });
    });
</script>

<script>

function login(){
	 
	  var validationStatus = true;
	
	  if(document.getElementById("username").value==""){
		  validationStatus = false;
		  alert("Please Enter valid Username !");
	  }
	
	  if(document.getElementById("password").value==""){
		  validationStatus = false;
		  alert("Please Enter valid Password !");
	  }
	  
	 if(validationStatus)
	 {	 
	  requesturl="login.action";
      document.forms[0].action = requesturl;
      document.forms[0].submit();
	 }

}


</script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>

<script type="text/javascript">
        $(document).ready(function() {
            $(".dropdown img.flag").addClass("flagvisibility");

            $(".dropdown dt a").click(function() {
                $(".dropdown dd ul").toggle();
            });
                        
            $(".dropdown dd ul li a").click(function() {
                var text = $(this).html();
                $(".dropdown dt a span").html(text);
                $(".dropdown dd ul").hide();
                $("#result").html("Selected value is: " + getSelectedValue("sample"));
            });
                        
            function getSelectedValue(id) {
                return $("#" + id).find("dt a span.value").html();
            }

            $(document).bind('click', function(e) {
                var $clicked = $(e.target);
                if (! $clicked.parents().hasClass("dropdown"))
                    $(".dropdown dd ul").hide();
            });


            $("#flagSwitcher").click(function() {
                $(".dropdown img.flag").toggleClass("flagvisibility");
            });
        });
    </script>


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


<div class="btn select" id="b1log"><a href="#">Log In</a>


</div>
<div class="btn long" id="b2"><a href="#">How Does It Work?</a></div>
<div class="btn" id="b3"><a href="pricing.jsp">Pricing</a></div>
<div class="btn" id="help"></div>

<!-- <div class="btn" id="primary"><a href="register.jsp">Register</a></div>

<div class="hidden logGate" id="frontMenu">
    <ul class="dropDn">
        <li><a href="#">Patient</a></li>
        <li><a href="#">Doctor</a></li>
    </ul>
</div> -->


<div class="btn" id="primary">
        <dl id="sample" class="dropdown">
          <dt><a href="#"><span>Register</span></a></dt>
          <dd>
            <ul>
              <!--  <li><a href="doctorRegister.jsp">Admin<img class="flag" src="br.png" alt="" /><span class="value">BR</span></a></li> -->
              <li><a href="doctorRegister.jsp">Doctor<img class="flag" src="br.png" alt="" /><span class="value">BR</span></a></li>
              <li><a href="register.jsp">Patient<img class="flag" src="fr.png" alt="" /><span class="value">FR</span></a></li>
            </ul>
          </dd>
        </dl>
      </div>

</nav>

<div class="fluid mainCNT home">  <!-- Large white area - divs to be placed here for content-->
<s:if test="hasActionMessages()"><div class="welcome"> <s:actionmessage/></div></s:if>
<div class="fluid topBnr">
<div class="login">
<form class="mainLogIn" method="post">
<input name="username"  id="username" type="text" id="logInTop" placeholder="User Name">
<input name="password" id="password" type="password" placeholder="Password">
<div class="btnTop"><a href="#" onClick="login()">Log In</a></div>
<div class="btnBtm"><a href="forgot.jsp">Forgot Password?</a></div>
</form>
</div>

</div>




<div class="fluid info">
<div class="pitch">
<div class="hm1">
<h2>Have an idea?</h2>
...but need more information.
</div>

<div class="hm1" id="two">
<h2>Ask People...</h2>
Poll directly to their smart phones.
</div>

<div class="hm1" id="three">
<h2>Analyze the results.</h2>
Examine the results yourself or have our professionals conduct the analysis.
</div>



</div>

 
</div> <!-- info -->

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
