<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>365 EMA Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Cool sample">
<meta name="author" content="someone">
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<!--Cool Sample css -->
<link href="css/cool.min.css" rel="stylesheet" media="screen">
<link href="css/docs.css" rel="stylesheet" media="screen">
<!-- JavaScript plugins (requires jQuery) -->
<script language="javascript" type="text/javascript" src="js/jquery-2.0.2.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/cool.min.js"></script>
<!-- Optionally enable responsive features in IE8 -->
<script src="js/respond.js"></script>
<script language="javascript" type="text/javascript" src="js/jquery.easing.js"></script>
<script language="javascript" type="text/javascript" src="js/pannels.js"></script>
<!--Include  javascript for document-->
<script src="js/docs.js"></script>

</head>
<body>
<div class="container-fluid page_header_">
  <div class="container">
    <div class="row">
      <div class="span3">
        <h1 class="site_logo_"><a href="index.html"><span>365 EMA</span></a></h1>
      </div>
      <div class="span9">
        <div class="navbar">
          <!--Top Menu-->
          <ul class="nav docs-top-nav">
            <li> <a href="doctorHome.jsp" title="Click to go Home Page">HOME</a></li>
            <li><a href="#" title="Click to go About us page">ABOUT US</a></li>
           <li><a href="logout.action" title="Logout">Logout</a></li>
          </ul>
          <!-- /docs-top-nav -->
        </div>
        <!--Top Menu-->
      </div>
    </div>
  </div>
</div>
<!------------------------------------------------>
<div id="content" class="container" role="page-container" style="min-height:1150px;">
<form method="get" action="questions.jsp">
  <div class="row">
    <!--------------------------------------------->
  <div class="clearfix"></div>
  <!--------------------------------------------->
    <div class="span9">
    <p>Survey name</p>
      <!--------------------------------------------->
		<input type="text" value="" class="span9" name="survey">
      <!--------------------------------------------->
      <p><input type="checkbox" value="#"> show participants a different name</p>


    </div>
    <div class="span3">
    <p class="text-error">FOLDER</p>
      <!--------------------------------------------->
		<select>
        <option value="#">My content</option>
        <option id="mode" role="button" value="#">Create new folder</option>
        </select>
       
      <!--------------------------------------------->
    </div>
  </div>
  <!--------------------------------------------->
  <div class="clearfix"></div>
  <!--------------------------------------------->
  <div class="row">
    <div class="span12">
     <button type="submit" class="btn btn-primary pull-right"> Save Survey </button>
    </div>
  </div>
  </form> 
</div>
<!--#container-->

<div class="container-fluid page_footer_">
  <div class="container">
    <!--#Footer-->
    <div class="row">
      <div class="span8">
        <div class="navbar">
          <!--#Footer Menu-->
          <ul class="inline">
            <li><a href="#" title="Click to go Home Page">HOME</a></li>
            <li><a href="#" title="Click to go About us page">ABOUT US</a></li>
            <li><a href="#" title="Click to go Contact us Page">CONTACT</a></li>
          </ul>
        </div>
        <!--#Footer Menu-->
        <hr>
        <p><small><i class="icon-home"></i>012 Some Street. New York, NY, 12345. USA  &nbsp;<i class="icon-file"></i>(123) 456-7890    &nbsp;<i class="icon-envelope"></i>someone@yourcompany.com</small></p>
        <!--#Footer Address-->
      </div>
      <div class="span4">
        <!--#Footer Social box-->
        <p>STAY CONNECTED</p>
        <hr>
        <ul class="nav inline">
          <li><a href="#" title="Connect with us on facebook"><span class="cool-black cool-facebook"></span></a></li>
          <li><a href="#" title="Connect with us on twitter"><span class="cool-black cool-twitter"></span></a></li>
          <li><a href="#" title="Connect with us on google plus"><span class="cool-black cool-google-plus"></span></a></li>
          <li><a href="#" title="Connect with us on youtube"><span class="cool-black cool-youtube"></span></a></li>
          <li><a href="#" title="Connect with us on skype"><span class="cool-black cool-skype"></span></a></li>
        </ul>
      </div>
      <!--#Footer Social box-->
      <!--------------------------------------------->
      <div class="clearfix"></div>
      <!--------------------------------------------->
    </div>
  </div>
</div>
<!--#Footer-->
<div class="container-fluid page_copyright_">
  <!--#Copyright-->
  <p class="text-center"><small>365 EMA  © 2013 all right reserved</small></p>
</div>
<!--#Copyright-->
<script language="javascript" type="text/javascript" src="js/floating_menu.js"></script>
<!-- Modal -->
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Modal header</h3>
  </div>
  <div class="modal-body">
    <p>One fine body…</p>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
    <button class="btn btn-primary">Save changes</button>
  </div>
</div>
</body>
</html>
