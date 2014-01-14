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

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('#primary').click(function(){         
            $( ".reg-list" ).slideToggle( "fast" );
        });
    });
</script>

<link rel="stylesheet" type="text/css" href="_css/jquery-ui.css" />
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<link rel="stylesheet" href="css/style.css" />

<script type="text/javascript" src="js/jquery.timepicker.js"></script>
<link rel="stylesheet" type="text/css" href="css/jquery.timepicker.css" />



<script>
  $(function() {
    $("#surveyStartDate").datepicker();
    $("#surveyEndDate").datepicker();
	
	$('#surveyStartTime').timepicker({
	'minTime': '1:00',
	'maxTime': '24:00',
	'showDuration': true
});

$('#surveyEndTime').timepicker({
	'minTime': '1:00',
	'maxTime': '24:00',
	'showDuration': true
});
	
  });
  

  
  </script>
  
  
  
  <script>
  
  
  function distributeSurvey(){
    
	  if (document.distributeForm.groupName.value=="0") 
	     {
	         alert("Please Select Ditribution User Group");
	         return false;
	     }

	  
		var requesturl="Distribute_DistributeForm.action";
	    document.distributeForm.action = requesturl;
		document.distributeForm.submit();
 	 
  }
  
  
  
  
  
  </script>

</head>


<body>
<div class="gridContainer clearfix">

  <header class="fluid hdr"> <img src="_images/logo.png"  border="0" alt="365EMA - logo"/>
  <div class="subscriber"><h4><a href="#">Welcome <%=(String)request.getSession().getAttribute("username") %></a><a href="logout">Log Out</a></h4>
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

<div style="position: relative">
    <div class="btn" id="primary"><a href="#">New Form</a></div>
    <div style="clear:both"></div>
    <div class="reg-list">
       <a href="newForm">Questionnaire</a><br/>
       <a href="#">Event Tracker</a>
    </div>
</div></nav>



<div class="fluid mainCNT home q">  <!-- Large white area - divs to be placed here for content-->
 
  <div class="qsteps">
	<div class="btn" id="set"><a href="newQuestionnaire.jsp" >Form Settings</a></div>
	<div class="btn " id="qcon"><a href="#">Form Construction</a></div>
	<div class="btn " id="preview"><a href="showQuestionByDoctor" >Preview</a></div>
	<div class="btn select" id="dist"><a href="Distribute_DistributeGroupView" class="active">Distribute</a></div>
    </div>

    
<div class="fullBar">

 <s:form id="distributeForm" action="Distribute_DistributeGroupView.action" method="post">
<h1 class="heading"><%=(String)request.getSession().getAttribute("surveyName") %></h1>

<h3>When:</h3>
 <!-- white content area -->

<div class="grayBox" id="dist">
<div class="blackRight" id="dgray">
<div class="bxSpc">
<h1>Deadline</h1>
End manually<input type="checkbox"><br>
Survey end date:<input type="text" id="surveyEndDate" name="surveyEndDate"><br>
Survey end time:<input type="time" id="surveyEndTime" name="surveyEndTime">
<!--<div class="btnSave">Save</div> -->
</div></div>

<div class="bxSpc">
<h1>Start</h1>
Start immediately<input type="checkbox"><br>
Survey start date:<input type="text" id="surveyStartDate" name="surveyStartDate" ><br>
Survey start time:<input type="time" id="surveyStartTime" name="surveyStartTime">

</div></div>
<br>
 <h3>Who:</h3> 
 <div class="grayBox" id="dist2">
<div class="blackRight" id="dgray">
<div class="bxSpc">
<!-- Create a group of participant to distribute to: --><br>
<!-- <div class="btnSave" id="long">Save Progress and Create Group</div> -->
</div></div>

<div class="bxSpc">
Select a group of participants to distribute to:
<s:select class="style2" name="groupName" id="groupName" list="userGroupList" listKey="id" listValue="groupName" headerKey="0" headerValue="Select" />
</div>
<div class="btn distribute" id="btmBig" onClick="distributeSurvey()"> Distribute Survey</div> 
  


</div>
  
 </s:form>
  
</div> <!-- main div containing white and nav-->
</div>
<footer id="mainFooter" class="fluid">&copy; 2013 Powered by Bayesoft</footer>
</div>
</body>
</html>
