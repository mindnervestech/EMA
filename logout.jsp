<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="SHORTCUT ICON" href="/images/webicon.png" />
<meta http-equiv="refresh" content="0; login"/>
<link href="css/udhome.css" rel="stylesheet" type="text/css">
<link href="css/singlefrm.css" rel="stylesheet" type="text/css"/>

<style type="text/css">
body{
	font-style: normal;
	font-variant: normal;
	font-weight: normal;
	font-size: 12px;
	line-height: 16px;
	font-family: open_sansregular, Arial, Helvetica, sans-serif;
}
.button {
    display: block;
    float: right;
    padding: 0;
    width: 200px;
    background-color: bisque;
}
.login-bg {}
.center {
	width: 950px;
	margin-left: auto;
	margin-right: auto;
}
.header{ width:1000px}
.login{
	float:right;
	width:260px;
	line-height:24px
}
.login ul li{
	float:left;
	list-style:none
}
.login ul .entries{
	float:right
}

</style>
<title><s:text name="login.title" /></title>
</head>
<body>

	<div class='center header'><%@include file="incs/preheader.jspf" %></div>

	<div class='center'>
		<div class="login">
			<div><s:text name="logout.message" /></div>
			If you can see this page, your work has been saved successfully. 
			<ul>
				<li class="entries"><a href="login">Sign up again </a></li>
				<li><a href="/">goto Home Page</a></li>
			</ul>			
		</div>
		<div class="login-bg">
			<img src="images/bayeslogo26.jpg"/>
			
		</div>
	</div>

<%@include file="../incs/footer.jspf" %>
	
</body>
</html>