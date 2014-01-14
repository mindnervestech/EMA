<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Dashboard</title>
<link href="css_dev/boilerplate.css" rel="stylesheet" type="text/css" />
<link href="css_dev/fluid.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css" />

<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>

  <script type="text/javascript">
                 
                 function inviteUser(){
                	 
                	 var surveyId = document.getElementById("sendMail_questionnaires").value;
                	 var requesturl;
                	 
                	 
                	 if(surveyId){
                	       requesturl="sendMailImplement.action";
                	
                     
                /*  	$.ajax({
             		   	type: "POST",
             		   	url: requesturl,
             		    success: function(respText) {
             		        //tag.html(data).dialog({modal: true}).dialog('open');
             		        document.getElementById('message').innerHTML=respText;
             		      }
             		
             		});  */
             		
             		
                	       document.forms[0].action = requesturl;
                           document.forms[0].submit();
                	 
                 }
                 
                 }
                 
                 </script>
			
			

</head>
<body>
<div class="wrapper">
    <div class="header">
        <div class="logo">
        	<img src="images/logo.png" alt="" title="" />
        </div>
        <div class="topRightSection">
        	<div class="welcomeUser fltLeft">Welcome<a href="#"><%=(String)request.getSession().getAttribute("username") %></a><a href="logout">Log Out</a></div>
        	<div class="socialIcons fltRight">
            	<a href="#" class="facebook"></a>
                <a href="#" class="tweeter"></a>
                <a href="#" class="linkedin"></a>
            </div>
    	</div>
    </div>
	<div class="mainMenuSection">
    	<a href="myforms" class="menuBtns"><div class="dashboard">Dashboard</div></a>
        <a href="people"  class="menuBtns">Manage Participants</a>
        <a href="#" class="menuBtns"><div class="help">Help</div></a>
        <a href="#"  class="setting"></a>
        <a href="newForm"  class="addGreenBtn">New Study</a>
    </div>
    <div class="contentSection">
    	<div class="sectionMenu">
        	<a href="#">1. Study Set Up</a>
            <a href="#" >2. Study Questions</a>
            <a href="#" class="active">3. Distribute</a>
        </div>
        <div class="contentData">
            <h2 class="heading">Select the Patient Email ID for Questionnaire Invitation	</h2>
   
              <div class="quesContentArea">
			   <form id="form1" name="form1" method="post" action="sendMailImplement.action">
			   
			   
			   <p align="center" ></p>		      				      
				      <span><div align="center">Select Questionnaire</div></span>
					
			     <div align="center">
			       <p>&nbsp;</p>
			       <s:select class="style2" name="questionnaires" list="questionnaireList" listKey="id" listValue="questionnaireName" headerKey="0" headerValue="Select" multiple="true" size="5"/>
			     </div>	      
				      				      
				      <c:forEach var="emailUser" items="${usersEmail}">
				        <table width="560" border="2" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
				       
				        <tr>
                          <td width="447"><span>
                          <div align="left">${emailUser}</div></td>
				          <td width="105"><input type="checkbox" name="userEmail" value="${emailUser}" /></tseled>
			            </tr>
                      </table>
				    
				   
			     </c:forEach>
			   </form>
			  
			  
          </div>
      </div>
            <div class="contentFooterArea">
            	<div align="right"><a href="#" class="blueBtn" onclick="inviteUser()">Distribute Study</a>
				
          	      </div>
            </div>
  </div>
    </div>
    <div class="footer">
    &copy; 2013 Powered by Baysoft.
    </div>

</body>

</html>