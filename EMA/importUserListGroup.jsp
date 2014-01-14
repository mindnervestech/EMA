<%@page import="org.springframework.context.annotation.Import"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="java.util.List" %>
<%@ page import="com.bayessoft.ema.model.UsersGroup" %>
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

<% List<UsersGroup> userList = null; %>

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


<div class="btn" id="b1">
<a href="#">Dashboard</a>

</div>

<div class="btn" id="b2"><a href="#"><!-- Forms --></a></div>
<div class="btn" id="b3"><a href="people"><!-- People --></a></div>
<div class="btn" id="b4"><a href="#"><!-- Data --></a></div>
<div class="btn" id="help"></div>




<div class="btn" id="primary">
        <dl id="sample" class="dropdown">
          <dt><a href="#"><span>User Management</span></a></dt>
          <dd>
            <ul>
             <li><a href="importUserList.action">Import a List<img class="flag" src="fr.png" alt="" /><span class="value">FR</span></a></li>
              <li><a href="MyGroup_MyGroupView.action">Import a list to a Group<img class="flag" src="br.png" alt="" /><span class="value">BR</span></a></li>
              <li><a href="importUserListNewGroup.action">Import a list as a new Group<img class="flag" src="fr.png" alt="" /><span class="value">FR</span></a></li> 
              <li><a href="newUser.action">Enter Individual<img class="flag" src="br.png" alt="" /><span class="value">BR</span></a></li>
             <%--  <li><a href="#">Import Individual<img class="flag" src="fr.png" alt="" /><span class="value">FR</span></a></li>
              <li><a href="#">Add Individual to a Group<img class="flag" src="br.png" alt="" /><span class="value">BR</span></a></li> --%>                                     
            </ul>
          </dd>
        </dl>
      </div>




</nav>

<div class="fluid mainCNT home">  <!-- Large white area - divs to be placed here for content-->
<div class="jcontent">

 <p>
    <s:form id="base_info" action="MyGroup_uploadUserListwithGroup.action" method="post" enctype="multipart/form-data" >
    
	
	Select Group<br/><s:select class="style2" name="groupName" list="userGroupList" listKey="id" listValue="groupName" headerKey="0" headerValue="Select" />

      <s:file key="Upload User List" name="userImportFile"></s:file>	    
       <s:submit name="submit" type="submit" value="Import" />
      
      
    </s:form>
</p>


</div>
  <div class="dashbrd">
  
   <div class="indBar"><img src="_images/dashPnt.png" class="p1"><img src="_images/dashPnt.png" class="p2 hidden">
         <img src="_images/dashPnt.png" class="p3 hidden">
            <img src="_images/dashPnt.png" class="p4 hidden">
   
    
   
   
    <div class="lbar"></div>
    </div>	
      <div class="btn profile">
      <div class="profRt">
      <p>Member<br>Since 2013</p>
      <div class="btnp"><a href="#" onClick="updateProfile(<%=String.valueOf((Long)request.getSession().getAttribute("userid"))%>)">Update Profile</a></div>
      
      </div>
      
      <img src="_images/profFill.png" width="66">
      <h4><%=(String)session.getAttribute("firstName") %> <%=(String)session.getAttribute("lastName") %></h4>
      
      </div>
         <div class="btn select myForm"><a href="myforms">My Forms</a></div>
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
