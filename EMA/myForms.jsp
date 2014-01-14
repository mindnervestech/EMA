<%@page import="org.springframework.context.annotation.Import"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>

<script>

function frmSurveySuccess(responseText, statusText, xhr, $form){
	document.getElementById('surveydetails').style = "";
	//$('#divProgress').hide();
	//$('#divForm').show();
	//$("#refreshPage").attr("value","true");
	//$("#refreshPage").attr("value","true");
	//$("#frmRule_rule_ruleName").attr("disabled",true);
}


function handleHttpResponse() {
    if (xhr.readyState == 4) {
        try {
        if(xhr.status == 200) {
            //handle response your way
           alert(xhr.responseText);
          document.getElementById('surveydetails').innerHTML = xhr.responseText;
        }
        }catch(e) {
        }//error}
    }
}


function getSurveyDetails(surveyId){

alert(surveyId);
var requesturl='Myform_getSurvey.action?surveyId='+surveyId;
	$.ajax({url:requesturl,success:function(result){
	     alert(result);
	  }});


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
<div class="btn" id="help"></div>

<div class="btn" id="primary"><a href="#">New Form</a>
  <ul class="drop hidden">
  <li><a href="#">Patient</a></li>
  <li><a href="#">Doctor</a></li>
  </ul>


</div></nav>

<div class="fluid mainCNT home">  <!-- Large white area - divs to be placed here for content-->
<div class="jcontent">

  <form id="form1" method="post" name="form1" action="Myform_MyFormView.action">
				
				  <div id="surveydetails" style="display:true" >	
                  <table width="593" height="220" border="0" cellpadding="1" cellspacing="1">
                    <tr>
                      <td width="265" height="95">&nbsp;</td>
                      <td width="91">&nbsp;</td>
                      <td width="227" rowspan="5"><div align="center"><img src="images/myFormsThumbnail.PNG" width="224" height="209"></div></td>
                    </tr>
                    <tr>
                      <td height="28"><strong>Number of Questions ...........................</strong></td>
                      <td height="28"></td>
                    </tr>
                    <tr>
                      <td height="28"><strong>Number of Participants ........................</strong></td>
                      <td height="28">&nbsp;</td>
                    </tr>
                    <tr>
                      <td height="28"><strong>Time Left..................................................</strong></td>
                      <td height="28">&nbsp;</td>
                    </tr>
                    <tr>
                      <td height="28"><strong>Number of Forms Needed ....................</strong></td>
                      <td height="28">&nbsp;</td>
                    </tr>
                  </table>
                 
				   </div>
			
				   <p>&nbsp;</p>
				   <table width="695" height="108" border="0" cellpadding="1" cellspacing="1">
                     <tr>
                       <td width="140"><div align="center"><img src="_images/formIcon.png" width="55" height="67"></div></td>
                       <td width="153"><div align="center"><img src="_images/formIcon.png" width="55" height="67"></div></td>
                       <td width="176"><div align="center"><img src="_images/formIcon.png" width="55" height="67"></div></td>
                       <td width="198"><div align="center"><img src="_images/formIcon.png" width="55" height="67"></div></td>
                     </tr>
                     <tr>
                     
                      <s:iterator value="questionnaireList" status="stat" begin="0" end="3">
                         <td><div align="center"><a href="javascript:void(0)" onClick="getSurveyDetails(<s:property value="id" />)"><s:property value="%{questionnaireName}" /><!-- </a> --></div></td>
                       </s:iterator>
                     </tr>
                   </table>
                   
				   
                   <s:if test="questionnaireList.size>4" >
                     <table width="695" height="108" border="0" cellpadding="1" cellspacing="1">
                     <tr>
                       <td width="140"><div align="center"><img src="_images/formIcon.png" width="55" height="67"></div></td>
                       <td width="153"><div align="center"><img src="_images/formIcon.png" width="55" height="67"></div></td>
                       <td width="176"><div align="center"><img src="_images/formIcon.png" width="55" height="67"></div></td>
                       <td width="198"><div align="center"><img src="_images/formIcon.png" width="55" height="67"></div></td>
                     </tr>
                     <tr>
                     
                      <s:iterator value="questionnaireList" status="stat" begin="4" end="7">
                         <td><div align="center"><a href="javascript:void(0)" onClick="getSurveyDetails(<s:property value="id" />)"><s:property value="%{questionnaireName}" /><!-- </a> --></div></td>
                       </s:iterator>
                     </tr>
                   </table>
				</s:if>
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
      <h4><%=(String)session.getAttribute("firstName") %> <%=(String)request.getAttribute("lastName") %></h4>
      
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
