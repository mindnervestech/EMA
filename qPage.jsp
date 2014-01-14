<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
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

<link href="css/cool.css" rel="stylesheet" media="screen">
<link href="css/docs.css" rel="stylesheet" media="screen">
<link href="css/pannels.css" rel="stylesheet" media="screen">
<!-- JavaScript plugins (requires jQuery) -->
<script language="javascript" type="text/javascript" src="js/jquery-2.0.2.min.js"></script>
<script language="javascript" type="text/javascript" src="js/jquery.easing.js"></script>
<script language="javascript" type="text/javascript" src="js/pannels.js"></script>
<!--Include  javascript for document-->
<script src="js/cool.min.js"></script>
<!-- Optionally enable responsive features in IE8 -->
<script src="js/respond.js"></script>
<!--Include  javascript for document-->
<script src="js/docs.js"></script>



<script type="text/javascript">

function onBlur(el) {
    if (el.value == '') {
        el.value = el.defaultValue;
    }
}
function onFocus(el) {
    if (el.value == el.defaultValue) {
        el.value = '';
    }
}


  function showOfForm(frm) {
	  
	     
      var title;
	  var note_text;
	  var surveyName;
	  var textOption1;
	  var textOption2;
	  var textOption3;
	  var textOption4;
	  var minoptions;
	  var maxoptions;
	  var ismandatory;
	  
	  var isNameVisible;
	  var isAddressVisible ;
	  var isCityVisible;
	  var isStateVisible ;
	  var isZipVisible ;
	  var isCountryVisible ;
	  var isEmailVisible;
	  var isPhoneVisible ;
	  
	  var dataTypeInfo;
	  var dataType;
	  
	  var fieldType;
  
	  var url='submitquestion.action?questionTitle=';
	  
      if(!frm || !frm.elements) {
        return;
      }
      
      var elms = frm.elements;
      
      for(var i = 0, maxI = elms.length; i < maxI; ++i) {
    	  
        var elm = elms[i];
        
        //alert("Type: " + elm.type + "\nName: " + elm.name + "\nId: " + elm.id+ "\nValue: " +elm.value );
          
        
        if(elm.type=="text" &&  elm.name=="title")
        {
        	title=elm.value;
        	
        	if(title){
        	  url=url+title;
        	}
        	//alert(url);
        	
        }
        
    
        if(elm.type=="textarea" &&  elm.name=="note_text")
        {
        	note_text=elm.value;
        	if(note_text){
          	  url=url+"&questionDesc="+note_text;
          	}
        	//alert(url);
        	
        }
        
        if(elm.type=="hidden" &&  elm.name=="surveyName")
        {
        	surveyName=elm.value;
        	if(surveyName){
          	  url=url+"&surveyName="+surveyName;
          	}
        	//alert(url);
        	
        }
        
        if(elm.type=="text" &&  elm.name=="min_options")
        {
        	minoptions=elm.value;
        	if(minoptions){
        		 url=url+"&minSelection="+minoptions;
          	}
        	//alert(url);
        	
        }
        
        if(elm.type=="text" &&  elm.name=="max_options")
        {
        	maxoptions=elm.value;
        	if(maxoptions){
        		 url=url+"&maxSelection="+maxoptions;
          	}
        	//alert(url);
        	
        }
        
        if(elm.type=="checkbox" &&  elm.name=="mandatory")
        {
        	ismandatory=elm.value;
        	if(ismandatory){
        		 url=url+"&isMandatory="+ismandatory;
          	}
        	//alert(url);
        	
        }
        
        if(elm.type=="text" &&  elm.name=="text_opt_1")
        {
        	textOption1=elm.value;
        	if(textOption1){
        		url=url+"&answers="+textOption1;
          	}
        	//alert(url);
        	
        }
        
        if(elm.type=="text" &&  elm.name=="text_opt_2")
        {
        	textOption2=elm.value;
        	if(textOption2){
        		url=url+"-"+textOption2;
          	}
        	//alert(url);
        	
        }
        
        if(elm.type=="text" &&  elm.name=="text_opt_3")
        {
        	textOption3=elm.value;
        	if(textOption3){
        		url=url+"-"+textOption3;
          	}
        	//alert(url);
        	
        }
        
        if(elm.type=="text" &&  elm.name=="text_opt_4")
        {
        	textOption4=elm.value;
        	if(textOption4){
        		url=url+"-"+textOption4;
          	}
        	//alert(url);
        	
        }
        
        
        if(elm.type=="checkbox" &&  elm.name=="contact_name")
        {
        	isNameVisible=elm.value;
        	if(isNameVisible){
        		 url=url+"&isNameVisible="+isNameVisible;
          	}
        	//alert(url);
        	
        }
        
        if(elm.type=="checkbox" &&  elm.name=="contact_address")
        {
        	isAddressVisible=elm.value;
        	if(isAddressVisible){
        		 url=url+"&isAddressVisible="+isAddressVisible;
          	}
        	//alert(url);
        	
        }
        
        if(elm.type=="checkbox" &&  elm.name=="contact_city")
        {
        	isCityVisible=elm.value;
        	if(isCityVisible){
        		 url=url+"&isCityVisible="+isCityVisible;
          	}
        	//alert(url);
        	
        }
        
        if(elm.type=="checkbox" &&  elm.name=="contact_state")
        {
        	isStateVisible=elm.value;
        	if(isStateVisible){
        		 url=url+"&isStateVisible="+isStateVisible;
          	}
        	//alert(url);
        	
        }
        
        if(elm.type=="checkbox" &&  elm.name=="contact_zip")
        {
        	isZipVisible=elm.value;
        	if(isZipVisible){
        		 url=url+"&isZipVisible="+isZipVisible;
          	}
        	//alert(url);
        	
        }
        
        if(elm.type=="checkbox" &&  elm.name=="contact_country")
        {
        	isCountryVisible=elm.value;
        	if(isCountryVisible){
        		 url=url+"&isCountryVisible="+isCountryVisible;
          	}
        	//alert(url);
        	
        }
        
        if(elm.type=="checkbox" &&  elm.name=="contact_email")
        {
        	isEmailVisible=elm.value;
        	if(isEmailVisible){
        		 url=url+"&isEmailVisible="+isEmailVisible;
          	}
        	//alert(url);
        	
        }
        
        if(elm.type=="checkbox" &&  elm.name=="contact_phone")
        {
        	isPhoneVisible=elm.value;
        	if(isPhoneVisible){
        		 url=url+"&isPhoneVisible="+isPhoneVisible;
          	}
        	//alert(url);
        	
        }
        
        
        if(elm.type=="radio" &&  elm.name=="dataTypeInfo")
        {
        	dataTypeInfo=elm.value;
        	if(dataTypeInfo){
        		 url=url+"&dataTypeInfo="+dataTypeInfo;
          	}
        	//alert(url);
        	
        }
        
        
        
        if(elm.type=="radio" &&  elm.name=="dataType")
        {
        	dataType=elm.value;
        	if(dataType){
        		 url=url+"&dataType="+dataType;
          	}
        	//alert(url);
        	
        }
        
        
        
        if(elm.name=="field_type")
        {
        	fieldType=elm.value;
        	if(fieldType){
        		 url=url+"&fieldType="+fieldType;
          	}
        	//alert(url);
        	
        }
        
        
        
        
        //Multiple Choice Question
        if(elm.type=="hidden" &&  elm.name=="questionType" && elm.value=="multipleChoice")
        {
        	var requesturl=url+"&questionTypeId=1&isRandomized=1";
        	//alert("Calling Struts Action"+requesturl);	
        	
        	/* document.forms[0].action = requesturl;
            document.forms[0].submit(); */
        	
            var tag = $("<div></div>");
            
        	$.ajax({
    		   	type: "POST",
    		   	url: requesturl,
    		    success: function(respText) {
    		        //tag.html(data).dialog({modal: true}).dialog('open');
    		        document.getElementById('message').innerHTML=respText;
    		      }
    		
    		}); 
            
        	document.getElementById('message').innerHTML="";
        	document.getElementById('message').innerHTML="Question Saved Successfully";
        	document.getElementById($(".q-question_1").attr("id")).innerHTML=title;        	
        	document.getElementById($(".q-demo_1").attr("id")).innerHTML="<ul class='multi-radio'><li>"+textOption1+"</li><li>"+textOption2+"</li><li>"+textOption3+"</li><li>"+textOption4+"</li></ul>";       	
        	//document.getElementById($(".q-edit").attr("id")).style.display="none";
        	//document.getElementById($(".q").attr("id")).style.display="";
        	
        }
        
        
        
        //Ranking Based Question
        if(elm.type=="hidden" &&  elm.name=="questionType" && elm.value=="rankingScale")
        {
        	var requesturl=url+"&questionTypeId=2&isRandomized=1";
        	//alert("Calling Struts Action"+requesturl);	
        	
        	/* document.forms[0].action = requesturl;
            document.forms[0].submit(); */
        	
        
        	$.ajax({
    		   	type: "POST",
    		   	url: requesturl,
    		   	success: function(respText){
    			   	//document.getElementById('showParentRuleDiv').innerHTML = respText;			  				
    			}
    		}); 
            
 
            
            
        	document.getElementById('message').innerHTML="Question Saved Successfully";
        	document.getElementById($(".q-question_2").attr("id")).innerHTML=title;
        	document.getElementById($(".q-demo_2").attr("id")).innerHTML="<ul class='multi-radio'><li>"+textOption1+"</li><li>"+textOption2+"</li><li>"+textOption3+"</li><li>"+textOption4+"</li></ul>";
        	//document.getElementById($(".q-edit").attr("id")).style.display="none";
        	//document.getElementById($(".q").attr("id")).style.display="";
        	
        }
        
        //Contact Based Question
        if(elm.type=="hidden" &&  elm.name=="questionType" && elm.value=="contactBased")
        {
        	var requesturl=url+"&questionTypeId=4&isRandomized=1";
        	//alert("Calling Struts Action"+requesturl);	
        	
        	/* document.forms[0].action = requesturl;
            document.forms[0].submit(); */
        	
        
        	$.ajax({
    		   	type: "POST",
    		   	url: requesturl,
    		   	success: function(respText){
    			   	//document.getElementById('showParentRuleDiv').innerHTML = respText;			  				
    			}
    		}); 
            
        	document.getElementById('message').innerHTML="Question Saved Successfully";
        	document.getElementById($(".q-question_3").attr("id")).innerHTML=title;
        	document.getElementById($(".q-edit").attr("id")).style.display="none";
        	document.getElementById($(".q").attr("id")).style.display="";
        	
        }
        
        //Location Based Question
        if(elm.type=="hidden" &&  elm.name=="questionType" && elm.value=="locationBased")
        {
        	var requesturl=url+"&questionTypeId=7&isRandomized=1";
        	//alert("Calling Struts Action"+requesturl);	
        	
        	/* document.forms[0].action = requesturl;
            document.forms[0].submit(); */
        	
        
        	$.ajax({
    		   	type: "POST",
    		   	url: requesturl,
    		   	success: function(respText){
    			   	//document.getElementById('showParentRuleDiv').innerHTML = respText;			  				
    			}
    		}); 
        	
        	document.getElementById('message').innerHTML="Question Saved Successfully";
        	document.getElementById($(".q-question_4").attr("id")).innerHTML=title;
        	document.getElementById($(".q-edit").attr("id")).style.display="none";
        	document.getElementById($(".q").attr("id")).style.display="";
        	
        }
        
        //Date Time Based Question
        if(elm.type=="hidden" &&  elm.name=="questionType" && elm.value=="dateTime")
        {
        	var requesturl=url+"&questionTypeId=8&isRandomized=1";
        	//alert("Calling Struts Action"+requesturl);	
        	
        	/* document.forms[0].action = requesturl;
            document.forms[0].submit(); */
        	
        
        	$.ajax({
    		   	type: "POST",
    		   	url: requesturl,
    		   	success: function(respText){
    			   	//document.getElementById('showParentRuleDiv').innerHTML = respText;			  				
    			}
    		}); 
        	
        	document.getElementById('message').innerHTML="Question Saved Successfully";
        	document.getElementById($(".q-question_5").attr("id")).innerHTML=title;
        	document.getElementById($(".q-edit").attr("id")).style.display="none";
        	document.getElementById($(".q").attr("id")).style.display="";
        }
        
        //Photo Upload Question
        if(elm.type=="hidden" &&  elm.name=="questionType" && elm.value=="photoUpload")
        {
        	var requesturl=url+"&questionTypeId=6&isRandomized=1";
        	//alert("Calling Struts Action"+requesturl);	
        	
        	/* document.forms[0].action = requesturl;
            document.forms[0].submit(); */
        	
        
        	$.ajax({
    		   	type: "POST",
    		   	url: requesturl,
    		   	success: function(respText){
    			   	//document.getElementById('showParentRuleDiv').innerHTML = respText;			  				
    			}
    		}); 
        
        	document.getElementById('message').innerHTML="Question Saved Successfully";
        	document.getElementById($(".q-question_6").attr("id")).innerHTML=title;
        	document.getElementById($(".q-edit").attr("id")).style.display="none";
        	document.getElementById($(".q").attr("id")).style.display="";
        }
        
        //Rating Scale Question
        if(elm.type=="hidden" &&  elm.name=="questionType" && elm.value=="ratingScale")
        {
        	var requesturl=url+"&questionTypeId=3&isRandomized=1";
        	//alert("Calling Struts Action"+requesturl);	
        	
        	/* document.forms[0].action = requesturl;
            document.forms[0].submit(); */
        	
        
        	$.ajax({
    		   	type: "POST",
    		   	url: requesturl,
    		   	success: function(respText){
    			   	//document.getElementById('showParentRuleDiv').innerHTML = respText;			  				
    			}
    		}); 
        	
        	document.getElementById('message').innerHTML="Question Saved Successfully";
        	document.getElementById($(".q-question_7").attr("id")).innerHTML=title;
        	document.getElementById($(".q-demo_3").attr("id")).innerHTML="<ul class='multi-radio'><li></li><li></li><li></li><li></li></ul>";
        	document.getElementById($(".q-edit").attr("id")).style.display="none";
        	document.getElementById($(".q").attr("id")).style.display="";

        	
        }
        
        //Text Based Question
        if(elm.type=="hidden" &&  elm.name=="questionType" && elm.value=="textBased")
        {
        	var requesturl=url+"&questionTypeId=5&isRandomized=1";
        	//alert("Calling Struts Action"+requesturl);	
        	
        	/* document.forms[0].action = requesturl;
            document.forms[0].submit(); */
        	
        
        	$.ajax({
    		   	type: "POST",
    		   	url: requesturl,
    		   	success: function(respText){
    			   	//document.getElementById('showParentRuleDiv').innerHTML = respText;			  				
    			}
    		}); 
        	
        	document.getElementById('message').innerHTML="Question Saved Successfully";
        	document.getElementById($(".q-question_8").attr("id")).innerHTML=title;
        	document.getElementById($(".q-edit").attr("id")).style.display="none";
        	document.getElementById($(".q").attr("id")).style.display="";
        }
        

        
      }
    }


  function showOfDiv(div) {

      if(!div) {
        return;
      }
      div = typeof div === "string" ? document.getElementById(div) : div;
      var elms = div.getElementsByTagName("*");
      for(var i = 0, maxI = elms.length; i < maxI; ++i) {
        var elm = elms[i];
        switch(elm.type) {
          case "text":
          case "textarea":
          case "button":
          case "reset":
          case "submit":
          case "file":
          case "hidden":
          case "password":
          case "image":
          case "radio":
          case "checkbox":
          case "select-one":
          case "select-multiple":
            alert("Type: " + elm.type + "\nName: " +
                    elm.name + "\nId: " + elm.id+ "\nValue: " +elm.value );
        }
      }
    }
    </script>



<style type="text/css">
<!--
body {
	background-color: #444;
}
-->
</style></head>
<body>
<%

if(request.getParameter("surveyName")!=null){
	request.getSession().setAttribute("surveyName",request.getParameter("surveyName")); 
}

%>
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
        <a href="myforms"  class="menuBtns">Forms</a>
          <a href="people"  class="menuBtns">People</a>
        <a href="#" class="peopleHead"><div class="help">Data</div></a>
        <a href="#"  class="setting"></a>
     
    </div>
    <div class="contentSection">
    	<div class="sectionMenu">
        	<a href="newQuestionnaire.jsp" >Form Setting</a>
            <a href="#" class="active">Form Construction</a>
            <a href="showQuestionByDoctor" >Preview</a>
            <a href="Distribute_DistributeGroupView">Distribute</a>
        </div>
      
            <h2 class="heading"><%=(String)request.getSession().getAttribute("surveyName") %></h2>
            
            <input type="hidden" name="surveyName"  value='<%=request.getParameter("surveyName") %>' />
          
            
            <div class="quesCreateArea">
              <div id="fl_menu">
                <!--#floating-menu-->
                <div class="menu"> <a id="multiple_choice" href="javascript:void(0)" class="menu_item"><i class="icon-th-list"></i> Multiple choice</a>
                    <!--<a id="four" href="javascript:void(0)" class="menu_item"><i class="icon-th"></i> Matrix likert</a>-->
                  <a id="rank" href="javascript:void(0)" class="menu_item"><i class="icon-signal"></i> Rank</a> </div>
                <div class="menu">
                  <!--<a id="two" href="javascript:void(0)" class="menu_item"><i class="icon-user"></i> Name</a>-->
                  <a id="contact" href="javascript:void(0)" class="menu_item"><i class="icon-envelope"></i> Contact</a> <a id="location" href="javascript:void(0)" class="menu_item"><i class="icon-book"></i> Location </a>
                  <!--<a id="four" href="javascript:void(0)" class="menu_item"><i class="icon-phone"></i> Phone Number</a>-->
                  <a id="date_time" href="javascript:void(0)" class="menu_item"><i class="icon-calendar"></i> Date/Time</a>
                  <!--<a id="three" href="javascript:void(0)" class="menu_item"><i class="icon-mobile"></i> Number</a> <a id="four" href="javascript:void(0)" class="menu_item"><i class="icon-link"></i> URL</a>-->
                <a id="photo_upload" href="javascript:void(0)" class="menu_item"><i class="icon-upload"></i> Photo Upload</a> <a id="rating_scale" href="javascript:void(0)" class="menu_item"><i class="icon-file"></i> Rating Scale</a> <a id="free_text" href="javascript:void(0)" class="menu_item"><i class="icon-file"></i> Text</a> </div>
                <!--<div class="menu"> <a id="one" href="javascript:void(0)" class="menu_item"><i class="icon-htmlsnipet"></i> HTML Snippet </a> </div>-->
              </div>
              <div class="row">
    <div class="span12">
      <div class="tabbable">
        <!-- Only required for left/right tabs -->
        <div class="tab-content">
          <!-------------------tab1-------------------------->
          <div class="tab-pane" id="tab1">
            <div class="row">
              <div class="span12" style="height:1150px">
                <h2>I'm for settin content.</h2>
                </div>
            </div>
          </div>
          <!-------------------tab2-------------------------->
          <div class="tab-pane active" id="tab2">
             <div class="clearfix" id="message"></div>
            <div class="row">
              <div class="span12" role="left-menu-containar"> <a href="javascript:void(0)">Questions</a>
               
              
              </div>
            </div>
            <!--------------------------------------------->
            <div class="clearfix"></div>
            <!--------------------------------------------->
            <div class="row">
              <div class="span2">
                <!-------------------left-menu-containar-------------------------->
                
                <!--#floating-menu-->
              </div>
              <!--------------------left-menu-containar----------------------->
              <div class="span10" style="min-height:800px">
                <div class="tabbable">
                  <!-- Only required for left/right tabs -->
                  <ul id="qedit_page_list" class="nav nav-tabs" style="width:auto">
                    <li class="active"><a href="#tabs1" data-toggle="tab">Page 1</a></li>
                  </ul>
                  <ul id="qp_ad_del" class="nav nav-pills">
                    <li id="qp_add" class="active pull-right"><a href="javascript:void(0)">Copy Page</a></li>
                    <li id="qp_del" class="active pull-right"><a href="javascript:void(0)">Delete Page</a></li>
                  </ul>
                  <div id="question_editor" class="tab-content">
                    <div class="tab-pane active" id="tabs1">
                      <!---------------------------tab 1------------------------------>
                      <div class="row-fluid panels se">
                       
                       <!------------------0000 PLACE FOR DYNAMIC CONTENT LODING 0000------------------------->
                        
                      </div>
                      
                      <div class="row-fluid panels-hide" style="display:none">
                        
                        <section id="" class="question page_header_section">
                                                  <!-------------------PAGE HEADER SECTION START---------------------->
                                                  <input class="number-hidden" type="hidden" value="">
                                                  <!--------------------------------------------->
                                                  <div id="" class="q">
                                                    <!-------------------PAGE HEADER qustion start---------------------->
                                                    <div class="q-left"></div>
                                                    <div class="q-body">
                                                      <div class="q-type"> Page Header </div>
                                                      <!---------------------edit control------------------------>
                                                      <div class="btn-group q-controls">
                                                      <a class="btn btn-small edit-qustion" href="javascript:void(0)"><i class="icon-edit"></i> Edit </a>
                                                        <a class="btn btn-small copy-qustion" href="javascript:void(0)"><i class="icon-copy"></i> Copy</a>
                                                        <a class="btn btn-small remove-qustion" href="javascript:void(0)"><i class="icon-remove"></i> Delete</a>
                                                      </div>
                                                      <!---------------------edit control------------------------>
                                                      <p class="clear"></p>
                                                      <div class="q-question">Page Heading</div>
                                                    </div>
                                                    <p class="clear"></p>
                                                  </div>
                                                  <!-------------------PAGE HEADER qustion end---------------------->
                                                  <!--------------------------------------------->
                                                  <div class="q-edit qt-1900" id="">
                                                    <!-------------------PAGE HEADER qustion edit start---------------------->
                                                    <form action="" method="post">
                                                      <div class="q-edit-left">
                                                        <div class="q-body">
                                                          <div class="q-left"> </div>
                                                          <div class="q-type"> Page Header <span class="optional_mandatory">*</span></div>
                                                          <!--------------------------------->
                                                          <div class="clearfix"></div>
                                                          <!--------------------------------->
                                                          <div class="q-header margin-top25">
                                                            <input type="text" name="title" class="" value="Page Heading" required="true">
                                                           <!--  <a class="btn btn-small media-insert" title="" href="javascript:void(0)"><i class="icon-camera"></i> Media</a>  --></div>
                                                          
                                                          <!--------------------------------->
                                                          <div class="clearfix"></div>
                                                          <!--------------------------------->
                                                          <div class="q-note optional_note">
                                                            <textarea rows="3" cols="40" class="" name="note_text" maxlength="1000">You can enter some information about this question here.</textarea>
                                                          </div>
                                                          <div class="divider-small"></div>
                                                          <p class="clear"></p>
                                                          <div class="q-edit-area"> </div>
                                                        </div>
                                                      </div>
                                                      <div class="q-edit-right">
                                                        <div class="q-options q-options-editor">
                                                          <div class="options" style="overflow:hidden;">
                                                            <div class="group no-border">
                                                              <label>
                                                                <input class="optional optional_text_note" name="note" type="checkbox" check="checked" >
                                                                Include a note</label>
                                                            </div>
                                                          </div>
                                                          <div class="editor-links">
                                                            <div class="editor-saving" style="display: none"> Saving… </div>
                                                            <div class="editor-buttons"> <a href="javascript:void(0)" class="btn btn-link cancel">Cancel</a>
                                                            <input type="hidden" name="questionType" value="multipleChoice" >
                                                             <input type="hidden" name="surveyName" value='<%=request.getParameter("survey") %>' >                                      
                                                              <input class="btn btn-primary" name="save" value="Done" type="submit" onClick=showOfForm(this.form);>
                                                            </div>
                                                          </div>
                                                          <p class="clear"></p>
                                                        </div>
                                                      </div>
                                                    </form>
                                                  </div>
                                                  <!-------------------PAGE HEADER qustion edit end---------------------->
                                                  <!--------------------------------------------->
                        </section>
                        <!-------------------PAGE HEADER SECTION START---------------------->
                        <section id="" class="question multiple_choice_section">
                          <!-------------------MULTIPLE CHOICE SECTION START---------------------->
                          <div id="" class="q">
                            <!-------------------MULTIPLE CHOICE qustion---------------------->
                            <div class="q-left">
                              <div class="q-number">
                                <div class="text">Question</div>
                                <div class="number">00</div>
                              </div>
                            </div>
                            <div class="q-body">
                              <div class="q-type"> Multiple Choice </div>
                              <!---------------------edit control------------------------>
                              <div class="btn-group q-controls">
                              <a class="btn btn-small edit-qustion" href="javascript:void(0)"><i class="icon-edit"></i> Edit </a>
                                <a class="btn btn-small copy-qustion" href="javascript:void(0)"><i class="icon-copy"></i> Copy</a>
                                <a class="btn btn-small remove-qustion" href="javascript:void(0)"><i class="icon-remove"></i> Delete</a>
                              </div>
                              <!---------------------edit control------------------------>
                              <p class="clear"></p>
                              <div class="q-question_1" id="titleQues 100">Please enter your question here.</div>
                              <div class="q-demo_1" id="optionsdiv 100">
                                <ul class="multi-radio">
                                  <li>Option 1</li>
                                  <li>Option 2</li>
                                </ul>
                              </div>
                            </div>
                            <p class="clear"></p>
                          </div>
                          <!-------------------MULTIPLE CHOICE qustion end---------------------->
                          <!-------------------------------------------->
                          <div id="" class="q-edit qt-400">
                            <!-------------------MULTIPLE CHOICE qustion edit start---------------------->
                            <form method="post" action="">
                              <div class="q-edit-left">
                                <div id="multy-q-body" class="q-body">
                                  <div class="q-left">
                                    <div class="q-number">
                                <div class="text">Question</div>
                                <div class="number">00</div>
                              </div>
                                  </div>
                                    
                                  <div class="q-type"> Multiple Choice <span class="optional_mandatory">*</span></div>
                                  <!--------------------------------->
                                  <div class="clearfix"></div>
                                  <!--------------------------------->
                               
                                  <div class="q-question">
                                    <input type="text" maxlength="1000" value="Please enter your question here." name="title" required="true" class="abc" onblur="onBlur(this)" onfocus="onFocus(this)">
                                  <!--   <a class="btn btn-small media-insert" href="javascript:void(0)"><i class="icon-camera"></i> Media</a> --> </div>
                                  <!--------------------------------->
                                  <div class="clearfix"></div>
                                  <!--------------------------------->
                                  <div style="" class="q-note optional_note">
                                    <textarea maxlength="1000" name="note_text" class="text" cols="40" rows="3">You can enter some information about this question here.</textarea>
                                  </div>
                                  <div class="divider-small"></div>
                                  <input type="hidden" name="surveyName" value='<%=request.getParameter("surveyName") %>' >
                                  <!--------------------------------->
                                  <div class="clearfix"></div>
                                  <!--------------------------------->
                                  <div class="q-edit-area">
                                    <div class="edit-bg edit-bg-multi">
                                      <div class="swap">
                                        <!--------------------------------->
                                        <div class="btn-group" style="margin-top:-25px;"> <a href="javascript:void(0)" class="btn btn-small visual-editor"><i class="icon-edit"></i> Visual Editor</a> <a href="javascript:void(0)" class="btn btn-small plain-editor"><i class="icon-file"></i> Plain Editor</a> </div>
                                      </div>
                                      <!--------------------------------->
                                      <div class="clearfix"></div>
                                      <!--------------------------------->
                                      <div class="multi-edit-normal">
                                        <ul id="contain-text-fild" class="sortable multi ui-sortable">
                                          <!-------------MULTIPLE CHOICE visual editor start--------->
                                          <li class="multi-answer">
                                            <div class="answer-container"> <img alt="Drag Handle" src="images/ico-move.png">
                                              <input type="text" class="" value="Option 1" id="text_opt_1" name="text_opt_1" onblur="onBlur(this)" onfocus="onFocus(this)">
                                            </div>
                                           <!--  <a class="btn btn-small margin-left10 media-insert" href="javascript:void(0)"><i class="icon-camera"></i> Media</a> --> <a class="btn btn-small remove-text-field" href="javascript:void(0)" style="visibility:collapse"><i class="icon-remove"></i> Delete</a>
                                            <!--------------------------------->
                                            <div class="clearfix"></div>
                                            <!--------------------------------->
                                          </li>
                                          <li class="multi-answer">
                                            <div class="answer-container"> <img alt="Drag Handle" src="images/ico-move.png">
                                              <input type="text" class="" value="Option 2" id="text_opt_2" name="text_opt_3" onblur="onBlur(this)" onfocus="onFocus(this)">
                                            </div>
                                         <!--    <a class="btn btn-small margin-left10 media-insert" href="javascript:void(0)"><i class="icon-camera"></i> Media</a> --> <a class="btn btn-small remove-text-field" href="javascript:void(0)" style="visibility:collapse"><i class="icon-remove"></i> Delete</a>
                                            <!--------------------------------->
                                            <div class="clearfix"></div>
                                            <!--------------------------------->
                                          </li>
                                        </ul>
                                          <ul id="hidden-text-fild" class="sortable multi ui-sortable" style="display:none">
                                          <li class="multi-answer add-answer">
                                            <div class="answer-container"> <img alt="Drag Handle" src="images/ico-move.png">
                                              <input type="text" class="" value="" name="#">
                                            </div>
                                           <!--  <a class="btn btn-small margin-left10 media-insert" href="javascript:void(0)"><i class="icon-camera"></i> Media</a>  --><a class="btn btn-small remove-text-field" href="javascript:void(0)"><i class="icon-remove"></i> Delete</a>
                                            <!--------------------------------->
                                            <div class="clearfix"></div>
                                            <!--------------------------------->
                                          </li>
                                        </ul>
                                        <div class="btn-group"> <a href="javascript:void(0)" class="btn btn-small add_new_field"><i class=" icon-plus"></i> Add New Option</a> </div>
                                        <!-------------MULTIPLE CHOICE visual editor end--------->
                                      </div>
                                      <div class="multi-edit-plain">
                                        <textarea cols="40" rows="5" style=""></textarea>
                                      </div>
                                      <div style="" class="edit-controls optional_choice_type_2 optional_choice_type_3">
                                        <label class="min-max" for="min_options">Minimum # choices:<br>
                                        <input type="text" style="width: 50px" name="min_options">
                                        </label>
                                        <label class="min-max" for="max_options">Maximum # choices:<br>
                                        <input type="text" style="width: 50px" name="max_options">
                                        </label>
                                      </div>
                                      <div class="input optional_comments">
                                        <label>Comments:
                                          <input type="text" maxlength="100" tabindex="4" value="Please help us understand why you selected this answer" name="comment_text" onblur="onBlur(this)" onfocus="onFocus(this)">
                                        </label>
                                      </div>
                                      <p class="clear"></p>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div id="multy-q-edit-right" class="q-edit-right">
                                <div class="q-options q-options-editor">
                                  <div class="options">
                                    <input type="checkbox" name="mandatory" class="optional mandatory_check">
                                      Question is mandatory</label>
                                    <label><label>
                                      <input type="checkbox" name="note" class="optional optional_text_note">
                                      Include a note</label>
                                    <label>
                                      <input type="checkbox" name="other" class="optional optional_other_opt">
                                      Include "other" option</label>
                                    <label>
                                      <input type="checkbox" name="comments" class="optional optional_coment_check">
                                      Include user comments</label>
                                    <label>
                                    <h6> Choice type</h6>
                                    <select name="choice_type" class="optional">
                                      <option value="0" selected="selected">Choose one (radio)</option>
                                      <option value="1">Choose one (list)</option>
                                      <option value="2">Choose many (check)</option>
                                      <option value="3">Choose many (list)</option>
                                    </select>
                                    </label>
                                    <label>
                                    <h6> Order choices</h6>
                                    <select name="order">
                                      <option value="0" selected="selected">As entered</option>
                                      <option value="1">A-Z</option>
                                      <option value="2">Z-A</option>
                                      <option value="3">Random</option>
                                    </select>
                                    </label>
                                  </div>
                                  <div class="editor-links">
                                    <div class="editor-saving hide"> Saving… </div>
                                    <div class="editor-buttons"> <a class="btn btn-link cancel" href="javascript:void(0)">Cancel</a>
                                      <input type="hidden" name="questionType" value="multipleChoice" >
                                       <input type="hidden" name="surveyName" value='<%=request.getParameter("survey") %>' >           
                                      <input type="button" value="Done" name="save" class="btn btn-primary" onClick=showOfForm(this.form);>
                                    </div>
                                  </div>
                                  <!--------------------------------->
                                  <div class="clearfix"></div>
                                  <!--------------------------------->
                                </div>
                              </div>
                            </form>
                          </div>
                          <!-------------------MULTIPLE CHOICE qustion edit end---------------------->
                          <!-------------------------------------------->
                        </section>
                        <!-------------------MULTIPLE CHOICE SECTION END---------------------->
                        <section id="" class="question rank_section">
                          <!-------------------RANK SECTION START---------------------->
                          <!-------------------------------------------->
                          <div id="" class="q">
                            <!-------------------RANK qustion start---------------------->
                            <div class="q-left">
                              <div class="q-number">
                                <div class="text">Question</div>
                                <div class="number">00</div>
                              </div>
                            </div>
                            <div class="q-body">
                            
                              <div class="q-type"> Rank <span class="optional_mandatory">*</span></div>
                              <!---------------------edit control------------------------>
                              <div class="btn-group q-controls">
                              <a class="btn btn-small edit-qustion" href="javascript:void(0)"><i class="icon-edit"></i> Edit </a>
                                <a class="btn btn-small copy-qustion" href="javascript:void(0)"><i class="icon-copy"></i> Copy</a>
                                <a class="btn btn-small remove-qustion" href="javascript:void(0)"><i class="icon-remove"></i> Delete</a>
                              </div>
                              <!---------------------edit control------------------------>
                              <p class="clear"></p>
                              <div class="q-question_2" id="titleQues 200">Please enter your question here.</div>
                              <div class="q-demo_2" id="optionsdiv 200">
                                <ul class="multi-checkbox multi-rank">
                                  <li>Option 1</li>
                                  <li>Option 2</li>
                                </ul>
                              </div>
                            </div>
                            <p class="clear"></p>
                          </div>
                          <!-------------------RANK qustion end---------------------->
                          <!-------------------------------------------->
                          <div id="" class="q-edit qt-1300">
                            <!-------------------RANK qustion edit start---------------------->
                            <form method="post" action="">
                              <div class="q-edit-left">
                                <input type="hidden" value="#" name="nonce">
                                <div class="q-body">
                                  <div class="q-left">
                                    <div class="q-number">
                                      <div class="text">Question</div>
                                      <div class="number">00</div>
                                    </div>
                                  </div>
                                    <!--   <div class="clearfix" id="message"></div> -->
                                  <div class="q-type"> Rank <span class="optional_mandatory">*</span></div>
                                  <p class="clear"></p>
                                  <div class="q-question">
                                    <input type="text" maxlength="1000" value="Please enter your question here." name="title" onblur="onBlur(this)" onfocus="onFocus(this)">
                                  <!--   <a class="btn btn-small media-insert" href="javascript:void(0)"><i class="icon-camera"></i> Media</a>  --></div>
                                  <!--------------------------------->
                                  <div class="clearfix"></div>
                                  <!--------------------------------->
                                  <div style="" class="q-note optional_note">
                                    <textarea maxlength="1000" name="note_text" class="text" cols="40" rows="3">You can enter some information about this question here.</textarea>
                                  </div>
                                  <div class="divider-small"></div>
                                  <p class="clear"></p>
                                  <div class="q-edit-area">
                                    <div class="edit-bg edit-bg-multi">
                                      <div class="swap">
                                        <!--------------------------------->
                                        <div class="btn-group" style="margin-top:-25px;"> <a href="javascript:void(0)" class="btn btn-small visual-editor"><i class="icon-edit"></i> Visual Editor</a> <a href="javascript:void(0)" class="btn btn-small plain-editor"><i class="icon-file"></i> Plain Editor</a> </div>
                                      </div>
                                      <!--------------------------------->
                                      <div class="clearfix"></div>
                                      <!--------------------------------->
                                      <div class="multi-edit-normal">
                                        <ul id="contain-text-fild" class="sortable multi ui-sortable">
                                          <!-------------MULTIPLE CHOICE visual editor start--------->
                                          <li class="multi-answer">
                                            <div class="answer-container"> <img alt="Drag Handle" src="images/ico-move.png">
                                              <input type="text" class="" value="Option 1" name="#" onblur="onBlur(this)" onfocus="onFocus(this)">
                                            </div>
                                     <!--        <a class="btn btn-small margin-left10 media-insert" href="javascript:void(0)"><i class="icon-camera"></i> Media</a> --> <a class="btn btn-small remove-text-field" href="javascript:void(0)" style="visibility:collapse"><i class="icon-remove"></i> Delete</a>
                                            <!--------------------------------->
                                            <div class="clearfix"></div>
                                            <!--------------------------------->
                                          </li>
                                          <li class="multi-answer">
                                            <div class="answer-container"> <img alt="Drag Handle" src="images/ico-move.png">
                                              <input type="text" class="" value="Option 2" name="#" onblur="onBlur(this)" onfocus="onFocus(this)">
                                            </div>
                                          <!--   <a class="btn btn-small margin-left10 media-insert" href="javascript:void(0)"><i class="icon-camera"></i> Media</a> --> <a class="btn btn-small remove-text-field" href="javascript:void(0)" style="visibility:collapse"><i class="icon-remove"></i> Delete</a>
                                            <!--------------------------------->
                                            <div class="clearfix"></div>
                                            <!--------------------------------->
                                          </li>
                                        </ul>
                                          <ul id="hidden-text-fild" class="sortable multi ui-sortable" style="display:none">
                                          <li class="multi-answer add-answer">
                                            <div class="answer-container"> <img alt="Drag Handle" src="images/ico-move.png">
                                              <input type="text" class="" value="" name="#">
                                            </div>
                                           <!--  <a class="btn btn-small margin-left10 media-insert" href="javascript:void(0)"><i class="icon-camera"></i> Media</a>  -->  <a class="btn btn-small remove-text-field" href="javascript:void(0)"><i class="icon-remove"></i> Delete</a>
                                            <!--------------------------------->
                                            <div class="clearfix"></div>
                                            <!--------------------------------->
                                          </li>
                                        </ul>
                                        <div class="btn-group"> <a href="javascript:void(0)" class="btn btn-small add_new_field"><i class=" icon-plus"></i> Add New Option</a> </div>
                                        <!-------------MULTIPLE CHOICE visual editor end--------->
                                      </div>
                                      <div class="multi-edit-plain visual_editer">
                                        <textarea cols="40" rows="5" style=""></textarea>
                                      </div>
                                      <div class="input optional_comments">
                                        <label>Comments:
                                          <input type="text" maxlength="100" tabindex="4" value="Please help us understand why you selected this answer" name="comment_text" onblur="onBlur(this)" onfocus="onFocus(this)">
                                        </label>
                                      </div>
                                      <p class="clear"></p>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div class="q-edit-right">
                                <div class="q-options q-options-editor">
                                  <div style="overflow:hidden;" class="options">
                                    <div class="group ">
                                      <label>
                                        <input type="checkbox" name="mandatory" class="optional mandatory_check">
                                        Question is mandatory</label>
                                    </div><div class="group ">
                                      <label>
                                        <input type="checkbox" name="note" class="optional optional_text_note">
                                        Include a note</label>
                                    </div>
                                    <div class="group ">
                                      <label>
                                      <h6> Order choices</h6>
                                      <select name="order">
                                        <option value="0" selected="selected">As entered</option>
                                        <option value="1">A-Z</option>
                                        <option value="2">Z-A</option>
                                        <option value="3">Random</option>
                                      </select>
                                      </label>
                                    </div>
                                  </div>
                                  <div class="editor-links">
                                    <div style="display: none" class="editor-saving"> Saving… </div>
                                    <div class="editor-buttons"> <a class="btn btn-link cancel" href="javascript:void(0)">Cancel</a>
                                      <input type="hidden" name="questionType" value="rankingScale" > 
                                      <input type="hidden" name="surveyName" value='<%=request.getParameter("survey") %>' >                                             
                                      <input type="button" value="Done" name="save" class="btn btn-primary" onClick=showOfForm(this.form);>
                                    </div>
                                  </div>
                                  <p class="clear"></p>
                                </div>
                              </div>
                              <input type="hidden" value="0" name="response_total">
                            </form>
                          </div>
                          <!-------------------RANK qustion edit end---------------------->
                          <!-------------------------------------------->
                          <div class="divider-small"></div>
                        </section>
                        <!-------------------RANK SECTION END---------------------->
                        <section id="" class="question location_section">
                          <!-------------------LOCATION SECTION START---------------------->
                            <div id="" class="q">
                              <div class="q-left">
                                <div class="q-number">
                                  <div class="text">Question</div>
                                  <div class="number">00</div>
                                </div>
                              </div>
                              <div class="q-body">
                               <!--  <div class="clearfix" id="message"></div> -->
                                <div class="q-type"> Location <span class="optional_mandatory">*</span></div>
                                <!---------------------edit control------------------------>
                              <div class="btn-group q-controls">
                              <a class="btn btn-small edit-qustion" href="javascript:void(0)"><i class="icon-edit"></i> Edit </a>
                                <a class="btn btn-small copy-qustion" href="javascript:void(0)"><i class="icon-copy"></i> Copy</a>
                                <a class="btn btn-small remove-qustion" href="javascript:void(0)"><i class="icon-remove"></i> Delete</a>
                               </div>
                              <!---------------------edit control------------------------>
                                <p class="clear"></p>
                                <div class="q-question_3" id="titleQues 300">Please enter your question here.</div>
                                <div class="q-demo_3" id="optionsdiv 300">
                                  <div class="custom-fields">
                                    <!--<div class="field-box">
                                      <div class="large"></div>
                                      <span>(e.g. john@example.com)</span> </div>-->
                                    <p class="clear"></p>
                                  </div>
                                </div>
                              </div>
                              <p class="clear"></p>
                            </div>
                            <div id="" class="q-edit qt-1400">
                              <form method="post" action="">
                               <input type="hidden" name="surveyName" value='<%=request.getParameter("survey") %>' >                             
                                <div class="q-edit-left">
                                  <div class="q-body">
                                    <div class="q-left">
                                      <div class="q-number">
                                        <div class="text">Question</div>
                                        <div class="number">00</div>
                                      </div>
                                    </div>
                                    <div class="q-type"> Location <span class="optional_mandatory">*</span> </div>
                                    <p class="clear"></p>
                                    <div class="q-question">
                                    <input type="text" maxlength="1000" value="Please enter your question here." name="title" onblur="onBlur(this)" onfocus="onFocus(this)">
                                   <!--  <a class="btn btn-small media-insert" href="javascript:void(0)"><i class="icon-camera"></i> Media</a> --> </div>
                                  <!--------------------------------->
                                  <div class="clearfix"></div>
                                  <!--------------------------------->
                                    <div style="" class="q-note optional_note">
                                      <textarea maxlength="1000" name="note_text" class="text" cols="40" rows="3">You can enter some information about this question here.</textarea>
                                    </div>
                                    <div class="divider-small"></div>
                                    <p class="clear"></p>
                                    <!--<div class="q-edit-area">
                                      <div class="edit-bg">
                                        <div class="custom-inputs">
                                          <div class="input-box">
                                            <input type="text" maxlength="100" value="(e.g. john@example.com)" name="example" class="large">
                                          </div>
                                          <p class="clear"></p>
                                        </div>
                                      </div>
                                    </div>-->
                                  </div>
                                </div>
                                <div class="q-edit-right" style="height: 151px;">
                                  <div class="q-options q-options-editor">
                                    <div style="overflow:hidden;" class="options">
                                      <div class="group ">
                                      <label>
                                       <input type="checkbox" name="mandatory" class="optional mandatory_check">
                                        Question is mandatory</label>
                                    </div><div class="group ">
                                      <label>
                                        <input type="checkbox" name="note" class="optional optional_text_note">
                                        Include a note</label>
                                    </div>
                                    </div>
                                    <div class="editor-links">
                                      <div style="display: none" class="editor-saving"> Saving… </div>
                                      <div class="editor-buttons"> <a class="btn btn-link cancel" href="javascript:void(0)">Cancel</a>
                                       <input type="hidden" name="surveyName" value='<%=request.getParameter("survey") %>' > 
                                        <input type="hidden" name="questionType" value="locationBased" > 
                                      <input type="button" value="Done" name="save" class="btn btn-primary" onClick=showOfForm(this.form);>
                                      </div>
                                    </div>
                                    <p class="clear"></p>
                                  </div>
                                </div>
                              </form>
                            </div>
                            <div class="divider-small"></div>
                        </section>
                        <!-------------------LOCATION SECTION END---------------------->
                        <section id="" class="question contact_section">
                          <!-------------------CONTACT SECTION START---------------------->
                          <div id="" class="q">
                            <div class="q-left">
                              <div class="q-number">
                                <div class="text">Question</div>
                                <div class="number">00</div>
                              </div>
                            </div>
                            <div class="q-body">
                             <!--  <div class="clearfix" id="message"></div> -->
                              <div class="q-type"> Contact </div>
                              <!---------------------edit control------------------------>
                              <div class="btn-group q-controls">
                              <a class="btn btn-small edit-qustion" href="javascript:void(0)"><i class="icon-edit"></i> Edit </a>
                                <a class="btn btn-small copy-qustion" href="javascript:void(0)"><i class="icon-copy"></i> Copy</a>
                                <a class="btn btn-small remove-qustion" href="javascript:void(0)"><i class="icon-remove"></i> Delete</a>
                              </div>
                              <!---------------------edit control------------------------>
                              <div class="q-question_4" id="titleQues 400">Please enter your question here.</div>
                              <div class="q-demo_4" id="optionsdiv 400">
                                <div class="custom-fields">
                                
                                  <!--<div class="field-box">
                                    <div class="large"></div>
                                    <span>Address Line 1</span> </div>
                                  <p class="clear"></p>
                                  <div class="divider-small"></div>
                                  <div class="field-box">
                                    <div class="large"></div>
                                    <span>Address Line 2</span> </div>
                                  <p class="clear"></p>
                                  <div class="divider-small"></div>
                                  <div class="field-box space">
                                    <div class="med-large"></div>
                                    <span>City</span> </div>
                                  <div class="field-box">
                                    <div class="med-large"></div>
                                    <span>State</span> </div>
                                  <p class="clear"></p>
                                  <div class="divider-small"></div>
                                  <p class="clear"></p>-->
                                  
                                </div>
                              </div>
                            </div>
                            <p class="clear"></p>
                          </div>
                          <div id="" class="q-edit qt-900">
                            <form method="post" action="">
                              <div class="q-edit-left">
                                <div class="q-body">
                                  <div class="q-left">
                                    <div class="q-number">
                                      <div class="text">Question</div>
                                      <div class="number">00</div>
                                    </div>
                                  </div>
                                     <!--  <div class="clearfix" id="message"></div> -->
                                  <div class="q-type"> Contact <span class="optional_mandatory">*</span></div>
                                  <p class="clear"></p>
                                  <div class="q-question">
                                    <input type="text" maxlength="1000" value="Please enter your question here." name="title" onblur="onBlur(this)" onfocus="onFocus(this)">
                                   <!--  <a class="btn btn-small media-insert" href="javascript:void(0)"><i class="icon-camera"></i> Media</a> --> </div>
                                  <!--------------------------------->
                                  <div class="clearfix"></div>
                                  <!--------------------------------->
                                  <div style="" class="q-note optional_note">
                                    <textarea maxlength="1000" name="note_text" class="text" cols="40" rows="3">You can enter some information about this question here.</textarea>
                                  </div>
                                  <div class="divider-small"></div>
                                  <p class="clear"></p>
                                  <div class="q-edit-area">
                                    <div class="edit-bg">
                                      <div class="custom-inputs">
                                        <div class="optional_place">
                                        <!----------------->
                                          <div class="input-box">
                                            <span>Is Name Visible</span>
                                            <label>Yes <input type="checkbox" name="contact_name" value="yes"></label>
                                            <label>No <input type="checkbox" name="contact_name" value="no"></label> 
                                          </div>
                                            <!----------------->
                                            <div class="input-box">
                                            <span>Is Address Visible </span>
                                            <label>Yes <input type="checkbox" name="contact_address" value="yes"></label>
                                            <label>No <input type="checkbox" name="contact_address" value="no"></label> 
                                            </div>
                                            <!----------------->
                                            <div class="input-box">
                                            <span>Is City Visible  </span>
                                            <label>Yes <input type="checkbox" name="contact_city" value="yes"></label>
                                            <label>No <input type="checkbox" name="contact_city" value="no"></label> 
                                            </div>
                                            <!----------------->
                                            <div class="input-box">
                                            <span>Is State Visible </span>
                                            <label>Yes <input type="checkbox" name="contact_state" value="yes"></label>
                                            <label>No <input type="checkbox" name="contact_state" value="no"></label> 
                                            </div>
                                            <!----------------->
                                            <div class="input-box">
                                            <span>Is Zip Visible </span>
                                            <label>Yes <input type="checkbox" name="contact_zip" value="yes"></label>
                                            <label>No <input type="checkbox" name="contact_zip" value="no"></label> 
                                            </div>
                                            <!----------------->
                                            <div class="input-box">
                                            <span>Is Country Visible </span>
                                            <label>Yes <input type="checkbox" name="contact_country" value="yes"></label>
                                            <label>No <input type="checkbox" name="contact_country" value="no"></label> 
                                            </div>
                                            <!----------------->
                                            <div class="input-box">
                                            <span>Is Email Visible </span>
                                            <label>Yes <input type="checkbox" name="contact_email" value="yes"></label>
                                            <label>No <input type="checkbox" name="contact_email" value="no"></label> 
                                            </div>
                                            <!----------------->
                                            <div class="input-box">
                                            <span>Is Phone Visible </span>
                                            <label>Yes <input type="checkbox" name="contact_phone" value="yes"></label>
                                            <label>No <input type="checkbox" name="contact_phone" value="no"></label> 
                                            </div>
                                            <!----------------->
                                          <p class="clear"></p>
                                        </div>
                                        <p class="clear optional_zip_country"></p>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div class="q-edit-right">
                                <div class="q-options q-options-editor">
                                  <div style="overflow:hidden;" class="options">
                                    <div class="group ">
                                      <label>
                                        <input type="checkbox" name="mandatory" class="optional mandatory_check">
                                        Question is mandatory</label>
                                    </div><div class="group ">
                                      <label>
                                        <input type="checkbox" name="note" class="optional optional_text_note">
                                        Include a note</label>
                                    </div>
                                    <!--<div class="group ">
                                      <label>
                                        <input type="checkbox" name="name" class="optional address-type">
                                        Name </label>
                                    </div>
                                    <div class="group ">
                                      <label>
                                        <input type="checkbox" name="address" class="optional address-type">
                                        Address </label>
                                    </div>
                                    <div class="group ">
                                      <label>
                                        <input type="checkbox" name="city" class="optional address-type">
                                        City</label>
                                    </div>
                                    <div class="group ">
                                      <label>
                                        <input type="checkbox" name="state" class="optional address-type">
                                        State</label>
                                    </div>
                                    <div class="group ">
                                      <label>
                                        <input type="checkbox" name="zip" class="optional address-type">
                                        Zip</label>
                                    </div>
                                    <div class="group ">
                                      <label>
                                        <input type="checkbox" name="country" class="optional address-type">
                                        Country</label>
                                    </div>
                                    <div class="group ">
                                      <label>
                                        <input type="checkbox" name="email" class="optional address-type">
                                        Email</label>
                                    </div>
                                    <div class="group ">
                                      <label>
                                        <input type="checkbox" name="phone" class="optional address-type">
                                        Phone</label>
                                    </div>-->
                                  </div>
                                  <div class="editor-links">
                                    <div style="display: none" class="editor-saving"> Saving… </div>
                                    <div class="editor-buttons"> <a class="btn btn-link cancel" href="javascript:void(0)">Cancel</a>
                                     <input type="hidden" name="surveyName" value='<%=request.getParameter("survey") %>' > 
                                       <input type="hidden" name="questionType" value="contactBased" > 
                                      <input type="button" value="Done" name="save" class="btn btn-primary" onClick=showOfForm(this.form);>
                                    </div>
                                  </div>
                                  <p class="clear"></p>
                                </div>
                              </div>
                            </form>
                          </div>
                          <div class="divider-small"></div>
                        </section>
                        <!-------------------CONTACT SECTION END---------------------->
                        <section id="" class="question photo_upload_section">
                          <!-------------------FILE UPLOAD SECTION START---------------------->
                          <div id="" class="q" style="display: block;">
                            <div class="q-left">
                              <div class="q-number">
                                <div class="text">Question</div>
                                <div class="number">00</div>
                              </div>
                            </div>
                            <div class="q-body">
                               <!--  <div class="clearfix" id="message"></div> -->
                              <div class="q-type"> File Upload <span class="optional_mandatory">*</span></div>
                              <!---------------------edit control------------------------>
                              <div class="btn-group q-controls">
                              <a class="btn btn-small edit-qustion" href="javascript:void(0)"><i class="icon-edit"></i> Edit </a>
                                <a class="btn btn-small copy-qustion" href="javascript:void(0)"><i class="icon-copy"></i> Copy</a>
                                <a class="btn btn-small remove-qustion" href="javascript:void(0)"><i class="icon-remove"></i> Delete</a>
                              </div>
                              <!---------------------edit control------------------------>
                              <p class="clear"></p>
                              <div class="q-question_5" id="titleQues 500">Please enter your question here.</div>
                              <div class="q-demo_5" id="optionsdiv 500">
                                <div class="custom-fields">
                                  <!--<div class="field-box">
                                    <div class="med upload">c:\path</div>
                                    <div class="upload-button">Upload</div>
                                    <p class="clear"></p>
                                  </div>-->
                                  <p class="clear"></p>
                                </div>
                              </div>
                            </div>
                            <p class="clear"></p>
                          </div>
                          <div style="" id="edit_4069044" class="q-edit qt-1600">
                            <form method="post" action="">
                              <div class="q-edit-left">
                                <input type="hidden" value="fb2d0485c6" name="nonce">
                                <div class="q-body">
                                  <div class="q-left">
                                    <div class="q-number">
                                      <div class="text">Question</div>
                                      <div class="number">00</div>
                                    </div>
                                  </div>
                                  <div class="q-type"> Photo Upload <span class="optional_mandatory">*</span></div>
                                  <p class="clear"></p>
                                  <div class="q-question">
                                    <input type="text" maxlength="1000" value="Please enter your question here." name="title" onblur="onBlur(this)" onfocus="onFocus(this)">
                                   <!--  <a class="btn btn-small media-insert" href="javascript:void(0)"><i class="icon-camera"></i> Media</a> --> </div>
                                  <!--------------------------------->
                                  <div class="clearfix"></div>
                                  <!--------------------------------->
                                  <div style="" class="q-note optional_note">
                                    <textarea maxlength="1000" name="note_text" class="text" cols="40" rows="3">You can enter some information about this question here.</textarea>
                                  </div>
                                  <div class="divider-small"></div>
                                  <p class="clear"></p>
                                  <div class="q-edit-area"> </div>
                                </div>
                              </div>
                              <div class="q-edit-right" style="height: 241px;">
                                <div class="q-options q-options-editor">
                                  <div style="overflow:hidden;" class="options">
                                    <div class="group ">
                                      <label>
                                        <input type="checkbox" name="mandatory" class="optional mandatory_check">
                                        Question is mandatory</label>
                                    </div><div class="group ">
                                      <label>
                                        <input type="checkbox" name="note" class="optional optional_text_note">
                                        Include a note</label>
                                    </div>
                                  </div>
                                  <div class="editor-links">
                                    <div style="display: none" class="editor-saving"> Saving… </div>
                                    <div class="editor-buttons"> <a class="btn btn-link cancel" href="javascript:void(0)">Cancel</a>
                                     <input type="hidden" name="surveyName" value='<%=request.getParameter("survey") %>' > 
                                      <input type="hidden" name="questionType" value="photoUpload" > 
                                      <input type="button" value="Done" name="save" class="btn btn-primary" onClick=showOfForm(this.form);>
                                    </div>
                                  </div>
                                  <p class="clear"></p>
                                </div>
                              </div>
                              <input type="hidden" value="0" name="response_total">
                            </form>
                          </div>
                        </section>
                        <!-------------------FILE UPLOAD SECTION END---------------------->
                        <section id="" class="question date_time_section">
                          <!-------------------DATE/TIME SECTION START---------------------->
                          <div id="" class="q">
                            <div class="q-left">
                              <div class="q-number">
                                <div class="text">Question</div>
                                <div class="number">00</div>
                              </div>
                            </div>
                            <div class="q-body">
                               <!--  <div class="clearfix" id="message"></div> -->
                              <div class="q-type"> Date/Time <span class="optional_mandatory">*</span></div>
                              <!---------------------edit control------------------------>
                              <div class="btn-group q-controls">
                              <a class="btn btn-small edit-qustion" href="javascript:void(0)"><i class="icon-edit"></i> Edit </a>
                                <a class="btn btn-small copy-qustion" href="javascript:void(0)"><i class="icon-copy"></i> Copy</a>
                                <a class="btn btn-small remove-qustion" href="javascript:void(0)"><i class="icon-remove"></i> Delete</a>
                              </div>
                              <!---------------------edit control------------------------>
                              <p class="clear"></p>
                              <div class="q-question_6" id="titleQues 600">Please enter your question here.</div>
                              <div class="q-demo_6" id="optionsdiv 600">
                                <div class="custom-fields">
                                  <!--<div class="field-box">
                                    <div class="small drop"></div>
                                    <span>MM</span> </div>
                                  <div class="field-box">
                                    <div class="small drop"></div>
                                    <span>DD</span> </div>
                                  <div class="field-box space">
                                    <div class="small"></div>
                                    <span>YYYY</span> </div>-->
                                  <p class="clear"></p>
                                </div>
                                
                              </div>
                            </div>
                            <p class="clear"></p>
                          </div>
                          <div style="" id="" class="q-edit qt-1000">
                            <form method="post" action="">
                              <div class="q-edit-left">
                                <div class="q-body">
                                  <div class="q-left">
                                    <div class="q-number">
                                      <div class="text">Question</div>
                                      <div class="number">00</div>
                                    </div>
                                  </div>
                                  <div class="q-type"> Date/Time <span class="optional_mandatory">*</span></div>
                                  <p class="clear"></p>
                                  <div class="q-question">
                                    <input type="text" maxlength="1000" value="Please enter your question here." name="title" onblur="onBlur(this)" onfocus="onFocus(this)">
                                  <!--   <a class="btn btn-small media-insert" href="javascript:void(0)"><i class="icon-camera"></i> Media</a> --> </div>
                                  <!--------------------------------->
                                  <div class="clearfix"></div>
                                  <!--------------------------------->
                                  <div style="" class="q-note optional_note">
                                    <textarea maxlength="1000" name="note_text" class="text" cols="40" rows="3">You can enter some information about this question here.</textarea>
                                  </div>
                                  <div class="divider-small"></div>
                                  <p class="clear"></p>
                                  <div class="q-edit-area">
                                    <div class="edit-bg">
                                      <!--<div class="custom-inputs">
                                        <div style="display: none" class="date_time optional_date_type_0">
                                          <div class="input-box">
                                            <input type="text" maxlength="50" value="MM" class="small" name="title_month[0]">
                                            <span>MM</span></div>
                                          <div class="input-box">
                                            <input type="text" maxlength="50" value="DD" class="small" name="title_day[0]">
                                            <span>DD</span></div>
                                          <div class="input-box space">
                                            <input type="text" maxlength="50" value="YYYY" class="small" name="title_year[0]">
                                            <span>YYYY</span></div>
                                          <div class="input-box">
                                            <input type="text" maxlength="50" value="H" class="x-small" name="title_hour[0]">
                                            <span>HH</span></div>
                                          <div class="input-box">
                                            <input type="text" maxlength="50" value="Mins" class="x-small" name="title_minute[0]">
                                            <span>M</span></div>
                                        </div>
                                        <div style="display: none" class="date_time optional_date_type_1">
                                          <div class="input-box">
                                            <input type="text" maxlength="50" value="DD" class="small" name="title_day[1]">
                                            <span>DD</span></div>
                                          <div class="input-box">
                                            <input type="text" maxlength="50" value="MM" class="small" name="title_month[1]">
                                            <span>MM</span></div>
                                          <div class="input-box space">
                                            <input type="text" maxlength="50" value="YYYY" class="small" name="title_year[1]">
                                            <span>YYYY</span></div>
                                          <div class="input-box">
                                            <input type="text" maxlength="50" value="H" class="x-small" name="title_hour[1]">
                                            <span>HH</span></div>
                                          <div class="input-box">
                                            <input type="text" maxlength="50" value="Mins" class="x-small" name="title_minute[1]">
                                            <span>M</span></div>
                                        </div>
                                        <div class="date_time optional_date_type_2">
                                          <div class="input-box">
                                            <input type="text" maxlength="50" value="MM" class="small" name="title_month[2]">
                                            <span>MM</span></div>
                                          <div class="input-box">
                                            <input type="text" maxlength="50" value="DD" class="small" name="title_day[2]">
                                            <span>DD</span></div>
                                          <div class="input-box space">
                                            <input type="text" maxlength="50" value="YYYY" class="small" name="title_year[2]">
                                            <span>YYYY</span></div>
                                        </div>
                                        <div style="display: none" class="date_time optional_date_type_3">
                                          <div class="input-box">
                                            <input type="text" maxlength="50" value="DD" class="small" name="title_day[3]">
                                            <span>DD</span></div>
                                          <div class="input-box">
                                            <input type="text" maxlength="50" value="MM" class="small" name="title_month[3]">
                                            <span>MM</span></div>
                                          <div class="input-box space">
                                            <input type="text" maxlength="50" value="YYYY" class="small" name="title_year[3]">
                                            <span>YYYY</span></div>
                                        </div>
                                        <div style="display: none" class="date_time optional_date_type_4">
                                          <div class="input-box">
                                            <input type="text" maxlength="50" value="H" class="x-small" name="title_hour[4]">
                                            <span>HH</span></div>
                                          <div class="input-box">
                                            <input type="text" maxlength="50" value="Mins" class="x-small" name="title_minute[4]">
                                            <span>M</span></div>
                                        </div>
                                        <p class="clear"></p>
                                      </div>-->
                                      <div class="custom-inputs">
                                        <div class="optional_place">
                                        <!----------------->
                                          <div class="input-box">
                                            <span>Date and time</span>
                                            <label>date <input type="radio" name="dataTypeInfo" value="yes"></label>
                                            <label>time <input type="radio" name="dataTypeInfo" value="no"></label>
                                            <label>DateTime <input type="radio" name="dataTypeInfo" value="no"></label>
                                          </div>
                                            <!----------------->
                                          <p class="clear"></p>
                                        </div>
                                        <p class="clear optional_zip_country"></p>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div class="q-edit-right">
                                <div class="q-options q-options-editor">
                                  <div style="overflow:hidden;" class="options">
                                    <div class="group ">
                                      <label>
                                        <input type="checkbox" name="mandatory" class="optional mandatory_check">
                                        Question is mandatory</label>
                                    </div><div class="group ">
                                      <label>
                                        <input type="checkbox" name="note" class="optional optional_text_note">
                                        Include a note</label>
                                    </div>
                                    <!--<div class="group ">
                                      <label>
                                      <h6> Date Format</h6>
                                      <select name="date_type" class="optional">
                                        <option value="0">mm/dd/yyyy hh:mm</option>
                                        <option value="1">dd/mm/yyyy hh:mm</option>
                                        <option value="2" selected="selected">mm/dd/yyyy</option>
                                        <option value="3">dd/mm/yyyy</option>
                                        <option value="4">hh:mm</option>
                                      </select>
                                      </label>
                                    </div>-->
                                  </div>
                                  <div class="editor-links">
                                    <div style="display: none" class="editor-saving"> Saving… </div>
                                    <div class="editor-buttons"> <a class="btn btn-link cancel" href="javascript:void(0)">Cancel</a>
                                     <input type="hidden" name="surveyName" value='<%=request.getParameter("survey") %>' > 
                                      <input type="hidden" name="questionType" value="dateTime" > 
                                      <input type="button" value="Done" name="save" class="btn btn-primary" onClick=showOfForm(this.form);>
                                    </div>
                                  </div>
                                  <p class="clear"></p>
                                </div>
                              </div>
                              <input type="hidden" value="0" name="response_total">
                            </form>
                          </div>
                          <div class="divider-small"></div>
                        </section>
                        <!-------------------DATE/TIME SECTION END---------------------->
                        <section id="free_text" class="question free_text_section">
                          <!-------------------FREE TEXT SECTION START---------------------->
                          <!-------------------------------------------->
                          <div id="" class="q">
                            <!-------------------FREE TEXT qustion start---------------------->
                            <div class="q-left">
                              <div class="q-number">
                                <div class="text">Question</div>
                                <div class="number">00</div>
                              </div>
                            </div>
                            <div class="q-body">
                              <!-- <div class="clearfix" id="message"></div> -->
                              <div class="q-type"> Free Text </div>
                              <!---------------------edit control------------------------>
                              <div class="btn-group q-controls">
                              <a class="btn btn-small edit-qustion" href="javascript:void(0)"><i class="icon-edit"></i> Edit </a>
                                <a class="btn btn-small copy-qustion" href="javascript:void(0)"><i class="icon-copy"></i> Copy</a>
                                <a class="btn btn-small remove-qustion" href="javascript:void(0)"><i class="icon-remove"></i> Delete</a>
                              </div>
                              <!---------------------edit control------------------------>
                              <p class="clear"></p>
                              <div class="q-question_7" id="titleQues 700">Please enter your question here.</div>
                              <div class="q-demo_7" id="optionsdiv 700">
                                <div class="custom-fields">
                                  <div class="field-box">
                                    <div class="large"></div>
                                  </div>
                                </div>
                                <p class="clear"></p>
                              </div>
                            </div>
                            <p class="clear"></p>
                          </div>
                          <!-------------------FREE TEXT qustion end---------------------->
                          <!-------------------------------------------->
                          <div style="" id="" class="q-edit qt-100">
                            <!-------------------FREE TEXT qustion edit start---------------------->
                            <form method="post" action="">
                              <div class="q-edit-left">
                                <div class="q-body">
                                  <div class="q-left">
                                    <div class="q-number">
                                      <div class="text">Question</div>
                                      <div class="number">00</div>
                                    </div>
                                  </div>
                                <!--   <div class="clearfix" id="message"></div> -->
                                  <div class="q-type"> Text </div>
                                  <p class="clear"></p>
                                  <div class="q-question">
                                    <input type="text" maxlength="1000" value="Please enter your question here." name="title" onblur="onBlur(this)" onfocus="onFocus(this)">
                                  <!--   <a class="btn btn-small media-insert" href="javascript:void(0)"><i class="icon-camera"></i> Media</a> --> </div>
                                  <!--------------------------------->
                                  <div class="clearfix"></div>
                                  <!--------------------------------->
                                  <div style="" class="q-note optional_note">
                                    <textarea maxlength="1000" name="note_text" class="text" cols="40" rows="3">You can enter some information about this question here.</textarea>
                                  </div>
                                  <div class="divider-small"></div>
                                  <p class="clear"></p>
                                  <div class="q-edit-area"> </div>
                                </div>
                              </div>
                              <div class="q-edit-right" style="height: 261px;">
                                <div class="q-options q-options-editor">
                                  <div style="overflow:hidden;" class="options">
                                    <div class="group ">
                                      <label>
                                        <input type="checkbox" name="mandatory" class="optional mandatory_check">
                                        Question is mandatory</label>
                                    </div><div class="group ">
                                      <label>
                                        <input type="checkbox" name="note" class="optional optional_text_note">
                                        Include a note</label>
                                    </div>
                                    <div class="group ">
                                      <label>
                                      <h6> Input size</h6>
                                      <select name="size">
                                        <option value="0">Small</option>
                                        <option value="1">Medium</option>
                                        <option value="2" selected="selected">Large</option>
                                      </select>
                                      </label>
                                    </div>
                                    <div class="group ">
                                      <label>
                                      <h6> Field Type</h6>
                                      <select name="field_type">
                                        <option value="singleLine" selected="selected">Single Line</option>
                                        <option value="multipleLine">Multi Line</option>
                                        <option value="password">Password</option>
                                      </select>
                                      </label>
                                    </div>
                                  </div>
                                  <div class="editor-links">
                                    <div style="display: none" class="editor-saving"> Saving… </div>
                                    <div class="editor-buttons"> <a class="btn btn-link cancel" href="javascript:void(0)">Cancel</a>
                                     <input type="hidden" name="surveyName" value='<%=request.getParameter("survey") %>' >
                                        <input type="hidden" name="questionType" value="textBased" > 
                                      <input type="button" value="Done" name="save" class="btn btn-primary" onClick=showOfForm(this.form);>
                                    </div>
                                  </div>
                                  <p class="clear"></p>
                                </div>
                              </div>
                            </form>
                          </div>
                          <!-------------------FREE TEXT qustion edit end---------------------->
                          <!-------------------------------------------->
                        </section>
                        <!-------------------FREE TEXT SECTION END---------------------->
                        <section id="" class="question rating_scale_section">
                          <!-------------------RATING SCALE SECTION START---------------------->
                          <div id="" class="q" style="display: block;">
                            <!-------------------RATING SCALE qustion---------------------->
                            <div class="q-left">
                              <div class="q-number">
                                <div class="text">Question</div>
                                <div class="number">00</div>
                              </div>
                            </div>
                            <div class="q-body">
                              <!-- <div class="clearfix" id="message"></div> -->
                              <div class="q-type"> Rating Scale </div>
                              <!---------------------edit control------------------------>
                              <div class="btn-group q-controls">
                              <a class="btn btn-small edit-qustion" href="javascript:void(0)"><i class="icon-edit"></i> Edit </a>
                                <a class="btn btn-small copy-qustion" href="javascript:void(0)"><i class="icon-copy"></i> Copy</a>
                                <a class="btn btn-small remove-qustion" href="javascript:void(0)"><i class="icon-remove"></i> Delete</a>
                              </div>
                              <!---------------------edit control------------------------>
                              <p class="clear"></p>
                              <div class="q-question_8" id="titleQues 800">Please enter your question here.</div>
                              <div class="q-demo_8" id="optionsdiv 800">
                                <ul class="multi-radio">
                                  <li>Option 1</li>
                                  <li>Option 2</li>
                                </ul>
                              </div>
                            </div>
                            <p class="clear"></p>
                          </div>
                          <!-------------------RATING SCALE qustion end---------------------->
                          <!-------------------------------------------->
                          <div id="" class="q-edit qt-400">
                            <!-------------------MULTIPLE CHOICE qustion edit start---------------------->
                            <form method="post" action="">
                              <div class="q-edit-left" style="min-height:300px">
                                <div id="multy-q-body" class="q-body">
                                  <div class="q-left">
                                    <div class="q-number">
                                <div class="text">Question</div>
                                <div class="number">00</div>
                              </div>
                                  </div>
                                  <div class="q-type"> Rating Scale <span class="optional_mandatory">*</span></div>
                                  <!--------------------------------->
                                  <div class="clearfix"></div>
                                  <!--------------------------------->
                                  <div class="q-question">
                                    <input type="text" maxlength="1000" value="Please enter your question here." name="title" onblur="onBlur(this)" onfocus="onFocus(this)">
                                 <!--    <a class="btn btn-small media-insert" href="javascript:void(0)"><i class="icon-camera"></i> Media</a> --> </div>
                                  <!--------------------------------->
                                  <div class="clearfix"></div>
                                  <!--------------------------------->
                                  <div style="" class="q-note optional_note">
                                    <textarea maxlength="1000" name="note_text" class="text" cols="40" rows="3">You can enter some information about this question here.</textarea>
                                  </div>
                                  <div class="divider-small"></div>
                                  <!--------------------------------->
                                  <div class="clearfix"></div>
                                  <!--------------------------------->
                                  <div class="q-edit-area">
                                    <div class="edit-bg edit-bg-multi">
                                      <!--------------------------------->
                                      <div class="clearfix"></div>
                                      <!--------------------------------->                                     
                                      <div style="" class="edit-controls optional_choice_type_2">
                                        <label class="min-max" for="min_options">Minimum Option:<br>
                                        <input type="text" style="width: 50px" name="min_options">
                                        </label>
                                        <label class="min-max" for="max_options">Maximum Option:<br>
                                        <input type="text" style="width: 50px" name="max_options">
                                        </label>
                                      </div>`
                                      
                                      <div class="custom-inputs">
                                        <div class="optional_place">
                                        <!----------------->
                                          <div class="input-box">
                                            <span>Option Type </span>
                                            <label>Numeric <input type="radio" name="dataType" value="yes"></label>
                                            <label>String <input type="radio" name="dataType" value="no"></label>
                                            <label>Boolean <input type="radio" name="dataType" value="no"></label>
                                          </div>
                                            <!----------------->
                                          <p class="clear"></p>
                                        </div>
                                        <p class="clear optional_zip_country"></p>
                                      </div>
                                      
                                      <div class="input optional_comments">
                                        <label>Comments:
                                          <input type="text" maxlength="100" tabindex="4" value="Please help us understand why you selected this answer" name="comment_text" onblur="onBlur(this)" onfocus="onFocus(this)">
                                        </label>
                                      </div>
                                      <p class="clear"></p>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div id="multy-q-edit-right" class="q-edit-right">
                                <div class="q-options q-options-editor">
                                  <div class="options">
                                    <input type="checkbox" name="mandatory" class="optional mandatory_check">
                                      Question is mandatory</label>
                                    <label><label>
                                      <input type="checkbox" name="note" class="optional optional_text_note">
                                      Include a note</label>
                                    
                                  </div>
                                  <div class="editor-links">
                                    <div class="editor-saving hide"> Saving… </div>
                                    <div class="editor-buttons"> <a class="btn btn-link cancel" href="javascript:void(0)">Cancel</a>
                                     <input type="hidden" name="surveyName" value='<%=request.getParameter("survey") %>' > 
                                     <input type="hidden" name="questionType" value="ratingScale" >
                                      <input type="button" value="Done" name="save" class="btn btn-primary" onClick=showOfForm(this.form);>
                                    </div>
                                  </div>
                                  <!--------------------------------->
                                  <div class="clearfix"></div>
                                  <!--------------------------------->
                                </div>
                              </div>
                            </form>
                          </div>
                          <!-------------------RATING SCALE qustion edit end---------------------->
                          <!-------------------------------------------->
                        </section>
                        <!-------------------RATING SCALE SECTION END---------------------->
                        
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
           
          </div>
          <!-------------------tab3-------------------------->
          <div class="tab-pane" id="tab3">
            <div class="row">
              <div class="span12" style="height:1150px">
                <h2>Survey Preview</h2>
                 <div align="center"><strong>Please Preview the Survey </strong><br>
                <a href="showQuestion.action" >Start Survey </a></div>
              </div>
            </div>
          </div>
          <div class="tab-pane" id="tab4">
            <div class="row">
              <div class="span12" style="height:1150px">
                <h2>I'm for Edit Language.</h2>
               
              </div>
            </div>
          </div>
          <!-------------------tab end-------------------------->
        </div>
        <!--#tab-content-->
      </div>
    </div>
  </div>
			  
            </div>
            <div class="contentFooterArea">
            	<!-- <a href="showQuestion.action" class="blueBtn">Save my progress</a> -->
            </div>
        </div>
    </div>
    <div class="footer">
    &copy; 2013 Powered by Baysoft.
    </div>
</div>
</body>
<script language="javascript" type="text/javascript" src="js/floating_menu.js"></script>
<section id="latest" class="last clear" style="display:none">

  <div id="" class="box_worper_ box_round_style_ box_border_ box_one">
    <h2>Pannel One</h2>
    <img src="images/cross.png" id="close" class="fl_right close">
    <input type="text" value="1" style="width:450px">
    <input type="submit" value=" save ">
    <p>Vestibulumaccumsan egestibulum eu justo convallis augue estas aenean elit intesque sed. Facilispede estibulum nulla orna nisl velit elit ac aliquat non tincidunt. Namjusto cras urna urnaretra lor urna neque sed quis orci nulla. Laoremut vitae doloreet condimentumst phasellentes dolor ut a ipsum id consectetus. Inpede cumst vitae ris tellentesque fring intesquet.</p>
  </div>
                       
</section>

<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Delete Question</h3>
  </div>
  <div class="modal-body">
    <p class="text-warning">Deleting a question will remove all responses that have been gathered for that question.
This action cannot be undone.</p>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true"> Cancel </button>
    <button class="btn btn-primary confirm"> Confirm </button>
  </div>
</div>



</html>