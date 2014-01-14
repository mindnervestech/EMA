<%@page import="org.springframework.context.annotation.Import"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="java.util.List" %>
<%@ page import="com.bayessoft.ema.model.Users" %>
<%@ page import="com.bayessoft.ema.dao.UserDAOImpl" %>
<%@ page import="com.bayessoft.ema.utils.AppServletContextListener" %>
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
	 
    var  requesturl="register.action";


$.ajax({
 	type: "POST",
 	url: requesturl,
  success: function(respText) {
      //tag.html(data).dialog({modal: true}).dialog('open');
      document.getElementById('message').innerHTML=respText;
    }

}); 

alert("Patient Added Successfully..You can see his/her email id on Invite Questionnaire");
  /*   document.forms[0].action = requesturl;
    document.forms[0].submit(); */

}

  </script>


<script>

function handleChange(value){
  
  if(value==1){
    window.location="newUser.action";
  }
   
    if(value==2){
    window.location="#";
  }
  
   if(value==3){
    window.location="#";
  }
  
   if(value==4){
    window.location="importUserList.action";
  }
  
   if(value==5){
	   window.location="importUserListGroup.action";
  }
   
    if(value==6){
    	   window.location="importUserListNewGroup.action";
		   
  }
   
  
}



</script>



</head>


<body>



<div class="gridContainer clearfix">

  <header class="fluid hdr"> <img src="_images/logo.png"  border="0" alt="365EMA - logo"/>
    <div class="sicons">
	
	</div>

  </header>
  
  
  <div class="fluid mainCNT home">  <!-- Large white area - divs to be placed here for content-->


<div class="jcontent">


<div>
 <p>
    <s:form id="base_info" action="register.action" method="post">
      <s:textfield key="Login Name" name="login"/>
      <s:password key="Password" name="password"/>
      <s:password key="Confirm Password" />
      <s:textfield key="First Name" name="firstName"/>
      <s:textfield key="Last Name" name="lastName"/>
      <s:radio list="%{'Doctor'}" id="registrationType" name="registrationType"></s:radio>
      <s:radio list="%{'Patient'}" id="registrationType" name="registrationType"></s:radio>  
      <s:label key="Gender"></s:label>
      <s:radio list="%{'M'}" id="gender" name="gender"></s:radio>
      <s:radio list="%{'F'}" id="gender" name="gender"></s:radio>
      
      <s:textfield key="DOB(YYYY-MM-DD)" name="dob"/>
      <s:textfield key="Email" name="email"/>
      <s:textarea key="Address" rows="4" cols="100" name="address"/>
      <s:textfield key="Contact Number" name="contactNumber"/>
      <s:textfield key="Mobile Number" name="mobileNumber"/>
      <s:textfield key="Twitter" name="twitter"/>
      <s:textfield key="Linkedin" name="linkedin"/>
      <s:textfield key="Facebook" name="facebook"/>
      <s:textfield key="Skype" name="skype"/>
      <s:file key="Upload Profile Photo" name="profilePhoto"></s:file>	
      
      <s:submit name="submit" type="submit" value="Register" onclick="inviteUser()"/>
    </s:form>
</p>

</div>
</div>

<footer id="mainFooter" class="fluid">&copy; 2013 Powered by Bayesoft</footer>
</div>
</body>
</html>
