<%@ page language="java" contentType="text/html; charset=utf-8"
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
    <link rel="stylesheet" href="_cssques/jquery-ui.css" />
    <link href="_cssques/boilerplate.css" rel="stylesheet" type="text/css">
    <link href="_cssques/fluid.css" rel="stylesheet" type="text/css">
    <link href="_cssques/pannels.css" rel="stylesheet" media="screen">
    <link href="_cssques/questionSection.css" rel="stylesheet" media="screen">
    <script src="_js/jquery-1.9.1.js"></script>
    <script src="_js/jquery-ui.js"></script>
    <script language="javascript" type="text/javascript" src="_js/jquery.easing.js"></script>
    <script language="javascript" type="text/javascript" src="_js/pannels.js"></script>
    <!--[if lt IE 9]>
<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
    <script src="_cssques/respond.min.js"></script>
</head>
<body>
<%

if(request.getParameter("surveyName")!=null){
	request.getSession().setAttribute("surveyName",request.getParameter("surveyName")); 
}

%>
    <div class="gridContainer clearfix">
        <header class="fluid hdr"><img src="_images/logo.png" border="0" alt="365EMA - logo"/>
	<div class="subscriber">
		<h4><a href="#">Welcome <%=(String)session.getAttribute("username") %></a><a href="logout">Log Out</a></h4>
		<ul class="drop hidden">
			<li><a href="#">Log Out</a></li>
			<li><a href="#">Profile</a></li>
		</ul>
	</div>
	<div class="sicons">
		<a href="#"><img src="_images/SocIcon.png"></a>
		<a href="#"><img src="_images/twitter.png"></a>
		<a href="#"><img src="_images/l-in.png"></a>
	</div>
	</header>
        <div class="fluid main">
            <!-- main div to keep navigation and content aligned-->
            <nav class="fluid mainNv">
            <!-- main navigation buttons-->
            <div class="btn " id="b1">
                <a href="#">Dashboard</a>
            </div>
            <div class="btn" id="b2">
                <a href="#"><!-- Forms --></a>
            </div>
            <div class="btn" id="b3">
                <a href="#"><!-- People --></a>
            </div>
            <div class="btn" id="b4">
                <a href="#"><!-- Data --></a>
            </div>
            <div class="btn" id="help">
            </div>
            <div class="btn" id="primary">
                <a href="#">New Form</a>
            </div>
		</nav>
            <div class="fluid mainCNT home q">
                <!-- Large white area - divs to be placed here for content-->
                <div class="qsteps">
                    <div class="btn" id="set">
                        <a href="newQuestionnaire.jsp">Form Settings</a>
                    </div>
                    <div class="btn select" id="qcon">
                        <a href="#">Form Construction</a>
                    </div>
                    <div class="btn dis" id="preview">
                        <a href="showQuestionByDoctor">Preview</a>
                    </div>
                    <div class="btn dis" id="dist">
                        <a href="Distribute_DistributeGroupView">Distribute</a>
                    </div>
                </div>
                <div class="quesContainer">
                    <!-- template menu Start -->
                    <div class="qusTool">
                        <div class="btn" id="multCh">
                            <a id="multiple_choice" class="menu_item" href="javascript:void(0)">Multipe Choice</a>
                        </div>
                        <div class="btn" id="rank">
                            <a id="ques_ranking" href="javascript:void(0)" class="menu_item" >Ranking</a>
                        </div>
                        <div class="btn" id="rating">
                            <a id="ques_rating" href="javascript:void(0)" class="menu_item" >Rating</a>
                        </div>
                        <div class="btn" id="text">
                            <a id="ques_fit" href="javascript:void(0)" class="menu_item" >Fill In Text</a>
                        </div>
                        <div class="btn" id="contact">
                            <a id="ques_contInfo" href="javascript:void(0)" class="menu_item" >Contact Information</a>
                        </div>
                        <div class="btn" id="location">
                            <a id="ques_location" href="javascript:void(0)" class="menu_item" >Loacation</a>
                        </div>
                        <div class="btn" id="date">
                            <a id="ques_dateTime" href="javascript:void(0)" class="menu_item" >Date &amp; Time</a>
                        </div>
                        <div class="btn" id="photo">
                            <a id="ques_photoUpload" href="javascript:void(0)" class="menu_item" >Photo Upload</a>
                        </div>
                    </div>
                    <!-- template menu END -->
                    <div class="questionArea">
                        <div class="page-list">
                            <div class="pages">
                                <ul class="thin-pill no-margin swap-pages float-left">
                                    <li><a class="icon-ok page_1" href="#">Page 1</a> </li>
                                    <li>
                                        <form action="" method="post" accept-charset="utf-8">
                                        <input type="hidden" name="action" value="new_page">
                                        <input type="hidden" name="nonce" value="c2bf1abd50">
                                        <a href="#" class="icon-plus">Add Page</a>
                                        </form>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- Page list end -->
                        <div style="color: #999; text-align: right;">
                            <form action="" method="post" accept-charset="utf-8">
                            <input type="checkbox" name="randomize" id="randomize">
                            <label style="color: #555; font-size: 12px;" for="randomize" title="When users view this survey page, the questions will be in a random order">
                                Randomize the questions on this page</label>
                            </form>
                        </div>
                        <div id="question_editor" class="tab-content">
                            <div class="placeholder questionWrapper">
                                <!------------------0000 PLACE FOR DYNAMIC CONTENT LODING 0000------------------------->
                                <!-- Empty div start -->
                                <div id="empty" class="editor-empty">
                                    <div class="head">
                                        This is where your questions will go</div>
                                    <div class="sub-head">
                                        Drag and drop or double click one of the icons from the menu to the left.</div>
                                </div>
                                <!-- Empty div End  -->
                                <div id="questionFormates" class="q" style="display: none;"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- white content area -->
        </div>
        <!-- main div containing white and nav-->
        <footer id="mainFooter" class="fluid">&copy; 2013 Powered by Bayesoft</footer>
    </div>
</body>
</html>
