<%@page import="org.springframework.context.annotation.Import"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="com.bayessoft.ema.model.Questionnaire" %>
<%@ page import="com.bayessoft.ema.model.Users" %>
<%@ page import="com.bayessoft.ema.business.EMAService" %>
<%@ page import="com.bayessoft.ema.dao.QuestionDAOImpl" %>
<%@ page import="com.bayessoft.ema.utils.AppServletContextListener" %>
<% String userId=String.valueOf((Long)request.getSession().getAttribute("userid"));

%>


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
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>

<script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('#primary').click(function(){         
            $( ".reg-list" ).slideToggle( "fast" );
        });
    });
</script>

<script>


function getReportByQuestionnaire(questionnaireId){
	 
	var requesturl="getResults_ReportView.action?questionnaireId="+questionnaireId;
    document.form1.action = requesturl;
	document.form1.submit();


}


function deleteQuestionnaire(questionnaireId){
	 
	var x;
	var r=confirm("Do You Want to Trash a Questionnaire!");
	if (r==true)
	  {
		
	     var requesturl="Myform_deleteQuestionnaire.action?surveyId="+questionnaireId;
		 document.form1.action = requesturl;
	     document.form1.submit(); 
	  }
	  

}


function makefavouriteQuestionnaire(questionnaireId){
	 
	var x;
	var r=confirm("Do You Want to make Questionnaire Favourite!");
	if (r==true)
	  {
		
	     var requesturl="Myform_makefavouriteQuestionnaire.action?surveyId="+questionnaireId;
		 document.form1.action = requesturl;
	     document.form1.submit(); 
	  }
	  

}



function editQuestionnaire(questionnaireId){
	 
		
	     var requesturl="Myform_editQuestionnaire.action?surveyId="+questionnaireId;
		 document.form1.action = requesturl;
	     document.form1.submit(); 


}


function updateProfile(userId){
	 
     var requesturl="Register_getProfileforEdit.action?userId="+userId;
	 document.form1.action = requesturl;
     document.form1.submit(); 

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
  <div class="subscriber"><h3><a href="#">Welcome <%=(String)request.getSession().getAttribute("username") %></a><a href="logout">Log Out</a></h3>
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


<div class="btn select" id="b1">
<a href="#">Dashboard</a>

</div>

<div class="btn" id="b2"><a href="#"><!-- Forms --></a></div>
<div class="btn" id="b3"><a href="people"><!-- People --></a></div>
<div class="btn" id="b4"><a href="#"><!-- Data --></a></div>


<!-- <div class="btn" id="primary"><a href="newForm">New Form</a>
  <ul class="drop hidden">
  <li><a href="#">Questionnaire</a></li>
  <li><a href="#">Event Tracker</a></li>
  </ul>


</div> -->



<div class="btn" id="primary">
        <dl id="sample" class="dropdown">
          <dt><a href="#"><span>New Form</span></a></dt>
          <dd>
            <ul>
              <li><a href="newForm">Questionnaire<img class="flag" src="br.png" alt="" /><span class="value">BR</span></a></li>
              <li><a href="newEventTracker">Event Tracker<img class="flag" src="fr.png" alt="" /><span class="value">FR</span></a></li>
            </ul>
          </dd>
        </dl>
      </div>



</nav>

<div class="fluid mainCNT home">  <!-- Large white area - divs to be placed here for content-->
<div class="jcontent">

  <s:if test="hasActionMessages()"><div class="welcome"> <s:actionmessage/></div></s:if>

<% List<Questionnaire> questionnaireList = null; %>
    <form id="form1" method="post" name="form1" onload="getDashBoardContent()">
          <div style="text-align: left">
                <p class="fluidList" style="text-align: right">
                  <%
                    
			EMAService emsService = (EMAService)AppServletContextListener.getSpringBeanFactory().getBean("emaService");
                  
            if(request.getSession().getAttribute("userid")!=null){
	  	     	questionnaireList=emsService.getQuestionnaireByDoctor((Long)request.getSession().getAttribute("userid"));
		
		    for(int i=0;i<questionnaireList.size();i++)
		    {  
		
		     if(questionnaireList.get(i).getQuestionnaireName()!=null){
		    	 
		       if(i%2==0){	 
		          out.println("<table class='whiteRow'>");
		       }
		       
		       else{
		    	   out.println("<table class='greyRow'>");
		       }
		       
		       out.println("<thead><tr>");
		       out.println("<td width='436' height='62'><a href='javascript:void(0)' class='showMap' onClick=getReportByQuestionnaire("+questionnaireList.get(i).getId()+");>"+questionnaireList.get(i).getQuestionnaireName()+"</a></td>");
		       out.println("<td width='90'><div align='center'><a href='#' ><img src='_images/trashIcon.png' width='30' height=v30' onClick=deleteQuestionnaire("+questionnaireList.get(i).getId()+");></a></div></td>");
		       out.println("<td width='61'><div align='center'><a href='#' ><img src='_images/gearLRG.png' width='30' height='30' onClick=editQuestionnaire("+questionnaireList.get(i).getId()+");></a></div></td>");
		       
		       if(questionnaireList.get(i).getFavourite()==1)
		          out.println("<td width='61'><div align='center'><a href='#' ><img src='_images/starred.png' width='30' height='30'></a></div></td>");
		       
		       else
			      out.println("<td width='61'><div align='center'><a href='#' ><img src='_images/star.png' width='30' height='30' onClick=makefavouriteQuestionnaire("+questionnaireList.get(i).getId()+");></a></div></td>");
 
		       
		       out.println("<td width='68'><a href='#' ><div align='center'><strong>1 </strong>Responses</div></a></td>");
		       
		       String expiryDate = questionnaireList.get(i).getExpirationDate();
		       
		       if(expiryDate!=null)
		       {
		    	   expiryDate=expiryDate.substring(0,10);		    	   
		       }
		       
		       out.println("<td width='69'><div align='center'>Expires On <strong>"+expiryDate+"</strong><span></span></div></td>");
		       
		   
		       
		       out.println("<td width='58'><a href='#' ><a href='#' ><img src='_images/anaylizeIconDeactive.png' width='54' height='57' onClick=getReportByQuestionnaire("+questionnaireList.get(i).getId()+");></a></td>");

		       out.println("</tr>");	
		       
		       out.println("<tr class='detailMap' style='display:none;''><td colspan='7'><img src='images/3dbarchart.png' alt='' title='' /></td></tr>");

		       out.println("</thead></table>");
		       out.println("________________________________________________________________________________________________");	
		     
		       

		     }

		    }
		    
           }
            
          %>
            </p>
    
    
      </div>
            <div style="text-align: left"></div>
        </form>
   


</div>
  <div class="dashbrd">
  
   <div class="indBar"><img src="_images/dashPnt.png" class="p1"><img src="_images/dashPnt.png" class="p2 hidden">
         <img src="_images/dashPnt.png" class="p3 hidden">
            <img src="_images/dashPnt.png" class="p4 hidden">
   
    
   <% Users user = null;
      String path = null;
      String basePath = null;
   
   %>
   
    <div class="lbar"></div>
    </div>	
      <div class="btn profile">
      <div class="profRt">
      <p>Member<br>Since 2013</p>
      <div class="btnp"><a href="#" onclick="updateProfile(<%=String.valueOf((Long)request.getSession().getAttribute("userid"))%>)">Update Profile</a></div>
      </div>
	  
	
      
	  <% 	QuestionDAOImpl questionDAOImpl = (QuestionDAOImpl)AppServletContextListener.getSpringBeanFactory().getBean("questionDAOImpl"); 
	  
	        user=questionDAOImpl.findUserById((Long)request.getSession().getAttribute("userid")).get(0);
	        path = request.getContextPath();
	        basePath = request.getScheme() + "://"
	    			+ request.getServerName() + ":" + request.getServerPort()
	    			+ path + "/";
	  
	  %>
	  
      <img src='<%=basePath %><%=user.getProfileUrl() %>' width="66">
      <h4><%=(String)session.getAttribute("firstName") %> <%=(String)session.getAttribute("lastName") %></h4>
      
      </div>
    <div class="btn select myForm"><a href="#">My Forms</a></div>
      <div class="btn myPeople"><a href="people">My People</a></div>
      <div class="btn myData"><a href="#">My Data</a></div>
      <div class="btn feedback"><a href="#">Feedback</a></div>

    
    </div>
    
   

</div> <!-- white content area -->
  
  
</div> <!-- main div containing white and nav-->

<footer id="mainFooter" class="fluid">&copy; 2013 Powered by Bayesoft</footer>
</div>
</body>
</html>
