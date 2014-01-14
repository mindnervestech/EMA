<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.math.BigInteger"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>  
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%> 
<%@ taglib prefix="sjc" uri="/struts-jquery-chart-tags"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.bayessoft.ema.model.Answer" %>
<%@ page import="com.bayessoft.ema.dao.QuestionDAOImpl" %>
<%@ page import="com.bayessoft.ema.business.EMAService" %>
<%@ page import="com.bayessoft.ema.utils.AppServletContextListener" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Dashboard</title>
<link href="css_dev/boilerplate.css" rel="stylesheet" type="text/css" />
<link href="css_dev/fluid.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="lingostyle.css" />
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
</head>
<body>
<% List<Answer> answerList = null;%>
<div class="wrapper">
  <div class="header">
    <div class="logo"> <img src="images/logo.png" alt="" title="" /> </div>
    <div class="topRightSection">
      <div class="welcomeUser fltLeft">Welcome<a href="#"><%=(String)request.getSession().getAttribute("username") %></a><a href="logout">Log Out</a></div>
      <div class="socialIcons fltRight"> <a href="#" class="facebook"></a> <a href="#" class="tweeter"></a> <a href="#" class="linkedin"></a> </div>
    </div>
  </div>
  <div class="mainMenuSection"> <a href="myforms" class="menuBtns">
    <div class="dashboard">Dashboard</div>
    </a> <a href="myforms"  class="menuBtns">Forms</a> <a href="people"  class="menuBtns">People</a> <a href="#" class="peopleHead">
      <div class="help">Data</div>
    </a> <a href="#"  class="setting"></a> </div>
  <div class="contentSection">
    <div class="contentData">
           <h2 class="heading">Form Questions</h2>
            <div class="quesCreateArea">
              <div>
 <p>
 
 <%   
 
 
  QuestionDAOImpl questionDAO = (QuestionDAOImpl)AppServletContextListener.getSpringBeanFactory().getBean("questionDAOImpl");
   
  EMAService emsService = (EMAService)AppServletContextListener.getSpringBeanFactory().getBean("emaService");
 
  String questionName = request.getParameter("questionName");
  answerList=questionDAO.findAllAnswersByQuestionId(Long.valueOf(questionName));
 
  out.println("<table width='857' height='92' border='1' align='center'><tr><td width='311'> <div align='center'>Question Asked  </div></td><td width='253' ><div align='center'>      Given Answer </div></td> <td width='104' ><div align='center'>Answered By </div></td>   </tr>");

           for(int i=0;i<answerList.size();i++)
		    {  
		
		
		       out.println("<tr>");
		      
		       out.println("<td width='58'>"+answerList.get(i).getQuestion().getQuestionTitle()+"</td>");
			   out.println("<td width='58'>"+answerList.get(i).getGivenAnswer()+"</td>");
			   out.println("<td width='58'>"+answerList.get(i).getAnsweredBy().getFirstName()+"</td>");

		       out.println("</tr>");	
		       
		
		
		
		
		}
		
		  out.println("</table>");
		  
 
 %>



<sj:head/>
<sjc:chart id="chartPie" cssStyle="width: 600px; height: 400px;" pie="true" pieLabel="true" >

	<s:iterator value="answerResultList" status="stat">
       
        
		<sjc:chartData label="%{answerOptionVal}" data='%{answerCount}' />
		

</s:iterator>

</sjc:chart> 

            
              </div>
              <p>&nbsp;</p>
              <p>&nbsp;</p>
              <p>&nbsp;</p>
            </div>
            </div>
  </div>
    <div class="footer">
    &copy; 2013 Powered by Baysoft.
    </div>
</div>
</body>
<script type="text/javascript">
$(document).off('click', '.showMap');
$(document).on('click', '.showMap', function () {
	$(this).closest('thead').find('.detailMap').slideDown("slow");
});
$(document).mouseup(function (e) {
	$('.detailMap').fadeOut(200);
});
</script>
</html>