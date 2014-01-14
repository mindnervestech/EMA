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
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>

<script>

function deleteUserGroup(groupId){
	 
	var x;
	var r=confirm("Do You Want to Trash a User!");
	if (r==true)
	  {
		
		
	     var requesturl="MyGroup_deleteUserfromGroup.action?userName="+groupId;
		 document.form1.action = requesturl;
	     document.form1.submit(); 
	  
	  
	  }
	
}



function updateProfile(userId){
	 
    var requesturl="Register_getProfileforEdit.action?userId="+userId;
	 document.form1.action = requesturl;
    document.form1.submit(); 

}


</script>


</head>


<body>

<% List<Users> userList = null; %>

<div class="gridContainer clearfix">



  <header class="fluid hdr"> <img src="_images/logo.png"  border="0" alt="365EMA - logo"/>
  <div class="subscriber"><h3><a href="#">Welcome <%=(String)session.getAttribute("username") %></a><a href="logout">Log Out</a></h3>
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
<div class="btn" id="help"></div>

<div class="btn" id="primary"><a href="newGroup">Add New Participant(s)</a>
  <ul class="drop hidden">
  <li><a href="#">Patient</a></li>
  <li><a href="#">Doctor</a></li>
  </ul>


</div></nav>

<div class="fluid mainCNT home">  <!-- Large white area - divs to be placed here for content-->
<div class="jcontent">

  <form id="form1" method="post" name="form1">
    
              			  <div id="userdetails" style="display:true" >	
    
                  <%
                    
					String groupId = null;
					UserDAOImpl userDAO = (UserDAOImpl)AppServletContextListener.getSpringBeanFactory().getBean("userDAOImpl");
                 
                    groupId = request.getParameter("groupId"); 
					
				if(groupId!=null){
		            userList=userDAO.listUsersByGroupId(Long.valueOf(groupId));
		
		    for(int i=0;i<userList.size();i++)
		    {  
		
		     if(userList.get(i).getFirstName()!=null){
		    	 
		 
		      
		       out.println("<table class='whiteRow'><thread>"); 
		       out.println("<tr>");
			   
			 if(userList.get(i).getGendor().equalsIgnoreCase("M"))
			   out.println("<td width='30'  rowspan='2'><div align='center'><a href='#' ><img src='_images/maleIcon.png' width='30' height='40'></a></div></td>");
			   
			 else if(userList.get(i).getGendor().equalsIgnoreCase("F"))
				  out.println("<td width='30' rowspan='2'><div align='center'><a href='#' ><img src='_images/femaleIcon.png' width='30' height=40'></a></div></td>");
				 
				 
		       out.println("<td width='500' height='62'><div align='left'>"+userList.get(i).getLastName()+","+userList.get(i).getFirstName()+"</td>");

		       out.println("<td width='45' height='62' rowspan='2'><div align='center'><a href='#' ><img src='_images/star.png' width='30' height=30'></a></div></td>");
		       out.println("<td width='45' height='62' rowspan='2'><div align='center'><a href='#' ><img src='_images/EMA3.6FormsPage_06.jpg' width='30' height='30'></a></div></td>");
			   out.println("<td width='45' height='62' rowspan='2'><div align='center'><a href='#' ><img src='_images/folderIcon.png' width='30' height=30'></a></div></td>");
			   out.println("<td width='45' height='62' rowspan='2'><div align='center'><a href='#' ><img src='_images/trashIcon.png' width='30' height=30' class='showMap' onClick=deleteUserGroup("+userList.get(i).getId()+");></a></div></td>");
		       out.println("</tr>");
		       
		       out.println("<tr><td  valign='top'>Volunteered  ,"+userList.get(i).getGendor()+" , "+userList.get(i).getDob()+"</td></tr>");
		       
		       out.println("</thread></table>");
		 	   out.println("________________________________________________________________________________________________");	
		     
		       

		     }

		    }
		    
		   }

          %>
		  
		  </div>
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
      <div class="btnp"><a href="#" onClick="updateProfile(<%=String.valueOf((Long)request.getSession().getAttribute("userid"))%>)">Update Profile</a></div>

      
      </div>
      
    <%--         <img src='<%=basePath %><%=user.getProfileUrl() %>' width="66">
      <h4><%=(String)session.getAttribute("firstName") %> <%=(String)session.getAttribute("lastName") %></h4> --%>
      
      
      </div>
      <div class="btn  myForm"><a href="#">My Forms</a></div>
      <div class="btn select myPeople"><a href="#">My People</a></div>
      <div class="btn myData"><a href="#">My Data</a></div>
      <div class="btn feedback"><a href="#">Feedback</a></div>

    
    </div>
    
   

</div> <!-- white content area -->
  
  
</div> <!-- main div containing white and nav-->

<footer id="mainFooter" class="fluid">&copy; 2013 Powered by Bayesoft</footer>
</div>
</body>
</html>
