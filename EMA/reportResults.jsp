<%@page contentType="text/html" pageEncoding="UTF-8"%>
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


</head>
<body>
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
    <s:form id="reportForm" action="getResults_getReport.action" method="post" >
    
	
	Select Question <br/>
	<s:select class="style2" name="questionName" list="listQuest" listKey="id" listValue="questionTitle" headerKey="0" headerValue="Select" />
    
       <s:submit name="submit" type="submit" value="Analyze Result" />

      
      
    </s:form>
</p>

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