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
<%-- <script src="_js/tinymce/tinymce.min.js"></script> --%>

<script type="text/javascript">

function saveUpdateQuestionnaire(surveyId){
	
	
	    var  validationStatus = true;
	    var fup = document.getElementById('uploadFormLogo');
	    var surveyName = document.getElementById('surveyName').value;
	    var fileName = fup.value;
	    var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
	    
	    if(surveyName==null || surveyName==""){
	    	alert("Please Enter Event Tracker Name!");
	    	validationStatus = false;
	    	return false;
	    }
	    
	    
	    if(fileName){
	    var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
	    
	    if(ext == "JPEG" || ext == "jpeg" || ext == "jpg" || ext == "JPG" || ext == "png" || ext == "PNG")
	    {
	    	 validationStatus = true;
	    } 
		
		else{
		
		  validationStatus = false;
		 document.getElementById('uploadFormLogo').value = "";
		alert("Upload PNG or Jpg images only");
		return false;
		 
		}
	   }
		
	   if(validationStatus){
		   document.forms[0].action = "Myform_saveQuestionnaire.action?isEventTracker=1&surveyId="+surveyId;
	       document.forms[0].submit();
	   }
}



/* tinymce.init({
    selector: "#surveyDesc"
 }); */



</script>


</head>


<body>

 <form method="post" enctype="multipart/form-data">
 
<div class="gridContainer clearfix">
 
  <header class="fluid hdr"> <img src="_images/logo.png"  border="0" alt="365EMA - logo"/>
  <div class="subscriber"><h4><a href="#">Welcome <%=(String)session.getAttribute("username") %></a><a href="logout">Log Out</a></h4>
  <ul class="drop hidden">
  <li><a href="#">Log Out</a></li>
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

<div class="btn" id="b2"><a href="#"><!-- Forms --></a></div>
<div class="btn" id="b3"><a href="people"><!-- People --></a></div>
<div class="btn" id="b4"><a href="#"><!-- Data --></a></div>
<div class="btn" id="help"></div>

<div class="btn" id="primary"><a href="#"></a></div></nav>



<div class="fluid mainCNT home q">  <!-- Large white area - divs to be placed here for content-->
  
  <div class="qsteps">
	<div class="btn prim" id="set"><a href="newQuestionnaire.jsp">Form Settings</a></div>
	<div class="btn dis" id="qcon"><a href="#">Form Construction</a></div>
	<div class="btn dis" id="preview"><a href="showEventByDoctor">Preview</a></div>
	<div class="btn dis" id="dist"><a href="Distribute_DistributeGroupView">Distribute</a></div>
    </div>
    
<div class="leftBar questionnaire">
<div class="grayBox">


<div class="bxSpc">

<s:actionerror />

<s:if test="hasActionMessages()"><div class="welcome"> <s:actionmessage/></div></s:if>

  <label>
  
  EventTracker Name:  
  <s:textfield name="surveyName" id="surveyName" size="39%" /></input>
 
 
  
  </label>
  
  </div>
<div class="blackBTM"></div> 
   

</div> <!-- white content area -->

<div class="grayBox" id="under">

<div class="bxSpc">
EventTracker Description:<br>
<s:textarea name="surveyDesc" />
<!--<div class="btmRight"><div class="btnSave" id="inline">Save</div><div class="btnSave" id="inline">Reset</div></div> -->
</div></div>

<div class="grayBox uploadLogo">
    Logo:
    <small>You upload a logo or photo to display at the bottom of your description.</small>
    <div><input type="file" name="uploadFormLogo" id="uploadFormLogo"/></div>
</div>

<div class="submitBar">
 
 <button type="submit" class="btn" id="btmBig" onClick="return saveUpdateQuestionnaire(null);"> Save Form </button>
  
</div><!-- rightBar -->
 
  
</div> <!-- main div containing white and nav-->

</div>
</form>
<footer id="mainFooter" class="fluid">&copy; 2013 Powered by Bayesoft</footer>
</body>
</html>
