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

		<title>My JSP 'show.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link rel="stylesheet" type="text/css" href="css/fluid.css" />
<link rel="stylesheet" type="text/css" href="css/boilerplate.css" />
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css" />
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript">
	
	<script>
	
	function inviteUser(){
	 
	      var  requesturl="submitanswer.action";
	
    
	$.ajax({
	   	type: "POST",
	   	url: requesturl,
	    success: function(respText) {
	        //tag.html(data).dialog({modal: true}).dialog('open');
	        document.getElementById('message').innerHTML=respText;
	      }
	
	}); 
	 
}



</script>
	
	
	</head>
	<div class="wrapper">
	<body>
	<br> 
	
	
	
	<div align="right" class="style3"><a href="logout.action" title="Logout">Logout</a></div>
		<strong>Questionnaire Questions</strong><br>
	
		<s:form id="submitAnswer" action="submitanswer.action" method="post">
<div class="row">
		<s:iterator value="listQuest" status="stat">
			<div class="listNumber"><s:property value="#stat.index+1" /></div>
   		 --
		<!--     <s:property value="%{id}" />---->
             <s:if test='%{questionType.getqTypeName() == "MULTIPLE CHOICE"}'>
				<s:property value="questionType.getqTypeName()" />
				<br />
				<s:property value="%{questionTitle}" />
				<br />
				<s:iterator value="%{questionDAO.getQuestionMultipleAttributes(id)}">
				<s:checkboxlist list="%{answers.split('-')}" id="MQ%{id}" name="3"></s:checkboxlist>
				</s:iterator>
				<br/>
				----------------------
				<br/></s:if>
				
	<s:if test='%{questionType.getqTypeName() == "RANKING QUESTIONS"}'>
				<s:property value="questionType.getqTypeName()" />
				<br />
				<s:property value="%{questionTitle}" />
				<br />
				<s:iterator value="%{questionDAO.getQuestionRankAttributes(id)}">
				<s:checkboxlist list="%{answers.split('-')}" id="RQ%{id}" name="3">				
				</s:checkboxlist>
				</s:iterator>
				<br/>
				----------------------
				<br/>
		  </s:if>
			
				<s:if test='%{questionType.getqTypeName() == "RATING SCALE"}'>
				<s:property value="questionType.getqTypeName()" />
				<br />
				<s:property value="%{questionTitle}" />
				<br />
				<s:textfield id="rate" name="rate"></s:textfield><br/>
				Minimum Option
				<s:textfield id="minrate" name="minrate" size="5"></s:textfield>
				Maximum Option
				<s:textfield id="maxrate" name="maxrate" size="5"></s:textfield>
				<br/>
				Option Type  <s:radio list="%{'Numeric'}" id="option" name="option"></s:radio>
				<s:radio list="%{'String'}" id="option" name="option"></s:radio>
				<s:radio list="%{'Boolean'}" id="option" name="option"></s:radio>
				
				<!--
				<s:iterator value="%{questionDAO.getQuestionRatingAttributes(id)}">
				<s:if test='%{answers != null}'>
				<s:checkboxlist list="%{answers.split('-')}" id="MQ%{id}" name="3">
				
				</s:checkboxlist>
				</s:if>	
				</s:iterator>
				--><br/>
				----------------------
				<br/></s:if>
				
				<s:if test='%{questionType.getqTypeName() == "CONTACT QUESTIONS"}'>
				<s:property value="questionType.getqTypeName()" />
				<br />
				<s:property value="%{questionTitle}" />
				
				  <table>
				    
					<tr><td>Enter Name<s:textfield/></td></tr>
					<tr><td>Enter City<s:textfield/></td></tr>
					<tr><td>Enter State<s:textfield/></td></tr>
					<tr><td>Enter PinCode<s:textfield/></td></tr>
					<tr><td>Enter ZipCode<s:textfield/></td></tr>
					<tr><td>Enter Country<s:textfield/></td></tr>
					<tr><td>Enter Phone<s:textfield/></td></tr>
					<tr><td>Enter Email<s:textfield/></td></tr>
					<tr><td>Enter Address<s:textarea/></td></tr>
				  </table>
				
				<br />
				<s:iterator value="%{questionDAO.getQuestionRatingAttributes(id)}">				</s:iterator>
				<br/>
				----------------------
				<br/></s:if>
				
				<s:if test='%{questionType.getqTypeName() == "PHOTO UPLOAD QUESTIONS"}'>
				<s:property value="questionType.getqTypeName()" />
				<br />
				<s:property value="%{questionTitle}" />
				<br />
				<s:file id="file" name="file"></s:file>
				<!--
				<s:iterator value="%{questionDAO.getQuestionRatingAttributes(id)}">
				<s:if test='%{answers != null}'>
				<s:checkboxlist list="%{answers.split('-')}" id="MQ%{id}" name="3">
				
				</s:checkboxlist>
				</s:if>	
				</s:iterator>
				--><br/>
				----------------------
				<br/></s:if>
				
				<s:if test='%{questionType.getqTypeName() == "TEXT QUESTIONS"}'>
				<s:property value="questionType.getqTypeName()" />
				<br />
				<s:property value="%{questionTitle}" />
				<br />
				<s:textarea id="text" name="text"></s:textarea>
				<!--
				<s:iterator value="%{questionDAO.getQuestionRatingAttributes(id)}">
				<s:if test='%{answers != null}'>
				<s:checkboxlist list="%{answers.split('-')}" id="MQ%{id}" name="3">
				
				</s:checkboxlist>
				</s:if>	
				</s:iterator>
				--><br/>
				----------------------
				<br/></s:if>
				
				<s:if test='%{questionType.getqTypeName() == "LOCATION BASED QUESTIONS"}'>
				<s:property value="questionType.getqTypeName()" />
				<br />
				<s:property value="%{questionTitle}" />
				<br />
				<s:textfield></s:textfield>
				<!--
				<s:iterator value="%{questionDAO.getQuestionRatingAttributes(id)}">
				<s:if test='%{answers != null}'>
				<s:checkboxlist list="%{answers.split('-')}" id="MQ%{id}" name="3">
				
				</s:checkboxlist>
				</s:if>	
				</s:iterator>
				--><br/>
				----------------------
				<br/></s:if>
				
				<s:if test='%{questionType.getqTypeName() == "DATETIME BASED QUESTIONS"}'>
				<s:property value="questionType.getqTypeName()" />
				<br />
				<s:property value="%{questionTitle}" />
				<br />
				<s:select list="{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31}"></s:select>
				<s:select list="{1,2,3,4,5,6,7,8,9,10,11,12}"></s:select>
				<s:select list="{1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020}"></s:select>
				<!--
				<s:iterator value="%{questionDAO.getQuestionRatingAttributes(id)}">
				<s:if test='%{answers != null}'>
				<s:checkboxlist list="%{answers.split('#')}" id="MQ%{id}" name="3">
				
				</s:checkboxlist>
				</s:if>	
				</s:iterator>
				--><br/>
				----------------------
				<br/></s:if>
			<!--    <s:property value="questionType.getqTypeName()"/>
-->

			<br />
		</s:iterator>
		
		
			<s:submit name="submit" type="submit" value="Give Answer" onclick="giveAnswer()"/>
		</div>
		</s:form>
		</div>
	</body>
</html>
