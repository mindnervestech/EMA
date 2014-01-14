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

<script>


function inviteUser(){
	 
    var validationStatus = true;
    var email = document.getElementById('base_info_Email');
    var loginId = document.getElementById('base_info_login');
    var password = document.getElementById('base_info_Password');
    var confirmPassword = document.getElementById('base_info_Confirm Password');
    var firstName = document.getElementById('base_info_firstName');
    var dob= document.getElementById('base_info_dob');	
    	
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
   
    if(email.value==null || email.value==" "){
    	validationStatus = false;
	    alert('Please Enter Email Address!');
	    return false;
	    
    }
    
	if(!loginId.value){
		validationStatus = false;
	    alert('Please Enter Login Id!');
	    return false;
		
    }
		    
		    
	if(!password.value){
		validationStatus = false;
	    alert('Please Enter Password!');
	    return false;
	}
	
	if(!confirmPassword.value){
		validationStatus = false;
	    alert('Please Enter Confirm password!');
	    return false;
	}
	
	if(!firstName.value){
		validationStatus = false;
	    alert('Please Enter First Name!');
	    return false;
	}
	
	if(!dob.value){
		validationStatus = false;
	    alert('Please Enter DOB !');
	    return false;
	}
    
	 var matches = /(\d{4})[-\/](\d{2})[-\/](\d{2})/.exec(dob.value);

        if (matches == null)
         {   
        	 validationStatus = false;
             alert("Enter Date of birth in YYYY-MM-DD format !");
             return false;
         }
            
	    
	
	if(password.value!=confirmPassword.value){
		
		validationStatus = false;
	    alert('Password and Confirm Password not match !');
	    return false;
	}
    
    if (!filter.test(email.value)) {
    	validationStatus = false;
	    alert('Please provide a valid email address !');
	    return false;
	  
    }
    
    var fup = document.getElementById('base_info_profilePhoto');
    var fileName = fup.value;
    var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
    
    if(ext == "JPEG" || ext == "jpeg" || ext == "jpg" || ext == "JPG" || ext == "png" || ext == "PNG")
    {
    	 validationStatus = true;
    } 
    else
    {
    validationStatus = false;
    alert("Upload PNG or Jpg images only");
    return false;
    }
    
    
    
      if(validationStatus)
      {
    	  var requesturl="Register_createPatient.action?registrationType=doctor";
  	      document.base_info.action = requesturl;
  	      document.base_info.submit();
      }


    /*   document.forms[0].action = requesturl;
      document.forms[0].submit(); */
 
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


<div class="btn" id="b1log"><a href="login.jsp">Log In</a></div>
<div class="btn long" id="b2"><a href="#">How Does It Work?</a></div>
<div class="btn " id="b3"><a href="pricing.jsp">Pricing</a></div>
<div class="btn" id="help"></div>

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

<div class="fluid mainCNT home q">  <!-- Large white area - divs to be placed here for content-->
<div class="infoCNT">
<h1>Register Yourself on 365EMA </h1>
<div class="lcontent">

<s:if test="hasActionMessages()"><div class="welcome"> <s:actionmessage/></div></s:if>

<p>
  <s:form id="base_info"  method="post" enctype="multipart/form-data">
    <s:textfield key="Login Name" name="login"/>
    <s:password key="Enter Password" name="Password"/>
    <s:password key="Confirm Password" name="Confirm Password"/>
    <s:textfield key="Enter First Name" name="firstName"/>
    <s:textfield key="Enter Last Name" name="lastName"/>
    <s:radio key="Enter Gender" name="Gender" list="#{'M':'Female','F':'Male'}" />
    <s:textfield key="DOB(YYYY-MM-DD)" name="dob"/>
    <s:textfield key="Enter Email" name="Email"/>
    <s:textarea key="Enter Address" name="Address" rows="5" cols="80"/>
    
    <s:textfield key="Enter city" name="city" />
    <s:textfield key="Enter state" name="state"/>
    <s:textfield key="Enter country" name="country"/>
    <s:textfield key="Enter zipCode" name="zipCode"/>
    
    <s:textfield key="Contact Number" name="contactNumber"/>
    <s:textfield key="Mobile Number" name="mobileNumber"/>
    <s:textfield key="Enter Twitter" name="Twitter"/>
    <s:textfield key="Enter Linkedin" name="Linkedin"/>
    <s:textfield key="Enter Facebook" name="Facebook"/>
    <s:textfield key="Enter Skype" name="Skype"/>
    <s:file key="Upload Profile Photo" name="profilePhoto"></s:file>	
    <s:submit name="submit" type="submit" value="submit" onclick="return inviteUser();" />
  </s:form>
</p>
</div>
<p>&nbsp;</p>
</div>
<!-- information area -->




<div class="fluid info2">

  





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

