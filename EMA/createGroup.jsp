<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

<script>

function createGroup(){
	 
	  requesturl="MyGroup_createGroup.action";
      document.forms[0].action = requesturl;
      document.forms[0].submit();

}


function updateProfile(userId){
	 
    var requesturl="Register_getProfileforEdit.action?userId="+userId;
	 document.form1.action = requesturl;
    document.form1.submit(); 

}

</script>

</head>


<body>
<div class="gridContainer clearfix">

  <header class="fluid hdr"> <img src="_images/logo.png"  border="0" alt="365EMA - logo"/>
  <div class="subscriber">
    <h3><a href="#">Welcome <%=(String)request.getSession().getAttribute("username") %></a><a href="logout">Log Out</a></h3>
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

<div class="btn" id="primary"><a href="#">New Form</a>
  <ul class="drop hidden">
  <li><a href="#">Patient</a></li>
  <li><a href="#">Doctor</a></li>
  </ul>


</div></nav>

<div class="fluid mainCNT home">  <!-- Large white area - divs to be placed here for content-->
<div class="jcontent">

              <form id="form1" method="post" name="form1" action="MyGroup_createGroup.action">
				
				<table width="375" border="0" align="center" cellpadding="1" cellspacing="1">
  <tr>
    <td width="118" height="37">Group Name </td>
    <td width="241"><input name="groupName" type="text"></td>
  </tr>
  <tr>
    <td>Group Desc </td>
    <td><input name="groupDesc" type="text"></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><div align="right">
      <input name="Submit" type="submit" value="Create Group" onClick="createGroup()">
      <input name="Cancel" type="button" value="Cancel">
    </div></td>
  </tr>
</table>

				
		</form>


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
      <h4>First Lastname</h4>
      
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
