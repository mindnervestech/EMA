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

<link href="css_dev/boilerplate_custom.css" rel="stylesheet" type="text/css">
<link href="css_dev/fluid_custom.css" rel="stylesheet" type="text/css">

<link rel="stylesheet" type="text/css" href="_css/jquery-ui.css" />
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script src="_css/respond.min.js"></script>

<script>

  
  
  function submitforResults(){
	  
		
 	       var requesturl="getResults.action";
 	       document.getResults.action = requesturl;
            document.getResults.submit();
 	 
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

<% List<Users> userList = null; %>

<div class="gridContainer clearfix">

  <header class="fluid hdr"> <img src="_images/logo.png"  border="0" alt="365EMA - logo"/>
  <div class="subscriber"><h3><a href="#">Welcome <%=(String)request.getParameter("userid") %>></a></h3>
  <ul class="drop hidden">
  <li><a href="logout.action">Log Out</a></li>
  <li><a href="#">Profile</a></li>
  </ul>
  
  
  </div>
  
  
  <div class="sicons">
  <a href="#"><img  src="_images/SocIcon.png"></a>
  <a href="#"><img src="_images/twitter.png"></a>
  <a href="#"><img src="_images/l-in.png"></a>
  </div>

  </header>
  <div class="fluid main"> <!-- main div to keep navigation and content aligned-->
    
    <nav class="fluid mainNv"> <!-- main navigation buttons-->


<div class="btn " id="b1">
<a href="#">Dashboard</a>

</div>

<div class="btn " id="b2"><a href="myforms"><!-- Forms --></a></div>
<div class="btn" id="b3"><a href="people"><!-- People --></a></div>
<div class="btn select" id="b4"><a href="mydata"><!-- Data --></a></div>
<div class="btn" id="b5"><img src="_images/gearLRG.png" width="30" height="30"></div>

<div class="btn" id="primary"><a href="newForm">New Form</a></div></nav>

<div class="fluid mainCNT home">  <!-- Large white area - divs to be placed here for content-->

 <div class="dashbrd">
      <div class="btn profile"></div>
      <div class="btn myForm"><a href="myforms">My Forms</a></div>
      <div class="btn  myPeople"><a href="people">My People</a></div>
      <div class="btn select myData"><a href="#">My Data</a></div>
      <div class="btn feedback"><a href="#">Feedback</a></div>
 </div>
	

	
<div class="dashboardRight">
    <form id="form1" method="post" name="form1">
            <div style="text-align: center">
    
          <form name="getResults" id="getResults" action="getResults">
	
	   <p>&nbsp;</p>
	   <div class="inputElementDate">
	    Start Date<input type="text" id="startDate" />
		End Date<input type="text" id="endDate" />
		 
	      <input type="submit" value="Get Results" onclick="submitforResults()"/>
	
	
	</div>
	  <p>&nbsp;</p>
	  <p>&nbsp;</p>
	  <p>&nbsp;</p>
	  
	  
	  </form>
            <div style="text-align: left"></div>
        </form>
	</div>
</div> <!-- white content area -->
</div> <!-- main div containing white and nav-->
<footer class="fluid" id="mainFooter">&copy; 2013 Powered by Bayesoft</footer>
</div>

</body></html>