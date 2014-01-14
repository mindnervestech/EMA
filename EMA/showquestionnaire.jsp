<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>Patient Available Questionnaire</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script>
	
	function showQuestion(){
		
		
		 var questionnaireId = document.getElementById("questionnaires").value;
    	 var requesturl;
    	 
    	 alert(questionnaireId);
    	 
    	 if(questionnaireId){
    	       requesturl="showQuestion.action?questionnaireId="+questionnaireId;
    	
         
    	$.ajax({
 		   	type: "POST",
 		   	url: requesturl,
 		    success: function(respText) {
 		        //tag.html(data).dialog({modal: true}).dialog('open');
 		        document.getElementById('message').innerHTML=respText;
 		      }
 		
 		});  
 		
 		/* 
    	       document.forms[0].action = requesturl;
               document.forms[0].submit(); */
    	 
     }
     
		
		
	}
	
	</script>
	
	</head>

	<body>
	<br> 
	<div align="right" class="style3"><a href="logout.action" title="Available Questionnaire">Logout</a></div>
	<p align="center"><strong>Patient Available Questionnaire</strong></p>
		
		
		<p>
		 
<br>
 <form id="form1" name="form1" method="post" action="showQuestionByDoctor.action">
   <div align="center">
		         <p>&nbsp;</p>
		         <s:select class="style2" name="questionnaires" list="listQuestionnaire" listKey="id" listValue="questionnaireName" headerKey="0" headerValue="Select" multiple="false" size="5"/>
     <p>&nbsp;</p>
		    
	               <input name="Submit" type="submit" class="social-networks" value="Give Answer"/>
		            <input name="Cancel" type="submit" class="social-networks" id="Cancel" value="Cancel" />
		            <br/>
		            </p>
		           
                               </p>
   </div>
 </form>
	</body>
</html>
