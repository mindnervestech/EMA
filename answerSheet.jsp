<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
	<base href="<%=basePath%>">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Answer Sheet</title>
<link rel="stylesheet" type="text/css" href="css/fluid.css" />
<link rel="stylesheet" type="text/css" href="css/boilerplate.css" />
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css" />
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript">
  $(function() {
	  
    $("#dateAnswer").datepicker();
	  
    $("#counter").slider({
      value:100,
      min: 0,
      max: 500,
      step: 50,
      slide: function(event, ui) {
        $("#amount").text(ui.value);
      }
    });
    $("#amount").text($("#counter").slider("value"));
  });
  
  
  function  postAnswer(){
	 
	     var url = 'AnswerSubmit_submitAnswer.action?answerString='  ;
	     alert("You are going to Submit Questionnaire.....!");
		
	     //Question Type
	     
	        //EMA Question Type
	     $('.wrapper').each(function(input){
	    	 	   		 
	   		 $('.row').each(function(input){
	   			 
	   			 var questionIdAndType = $(this).attr('id');

	   			var qArr=questionIdAndType.split("-");
	   			 
	   			var questionType = qArr[1];
	   			
	   		    //alert('Question Type:' + questionType);
	   			
	   		    
	   		     //Multiple Choice Question
	   		     if(questionType == 1){
	   			 
			         var value = $('.checkboxinput:checked').val();
				     //alert('Selected Option:' + questionIdAndType+"#"+value);
				     if(value)
				     url = url+"~"+questionIdAndType+"-"+value;
				     
	   		     }
			     
			     //RANKING QUESTIONS
		   		  if(questionType == 2){
		   			  
		   		  }
	   		     
			     //RATING SCALE
		   		 if(questionType == 3){
		   			 
		   			var rateVal = $('#counter').slider("option", "value");
		   		   // alert('Rating Value Answer:' + questionIdAndType+"#"+rateVal);
		   		    if(rateVal)
		   		    url = url+"~"+questionIdAndType+"-"+rateVal;
		   		    
		   		  }
		   		 
		   		 //CONTACT QUESTIONS
		   		 if(questionType == 4){
		   			 
		   			var name = document.getElementById("name").value;
		   			var city = document.getElementById("city").value;
		   			var state = document.getElementById("state").value;
		   			var zipcode = document.getElementById("zipcode").value;
		   			var country = document.getElementById("country").value;
		   			var phone = document.getElementById("phone").value;
		   			var email = document.getElementById("email").value;
		   			var address = document.getElementById("address").value;
		   			 
		   		   // alert('Contact Based Answer :' + questionIdAndType+"#"+name+"-"+city+"-"+state+"-"+zipcode+"-"+country+"-"+phone+"-"+email+"-"+address); 
		   			 
		   		    if(name || city || state || zipcode || country || phone || email || address)
		   		    url = url+"~"+questionIdAndType+"-"+name+"-"+city+"-"+state+"-"+zipcode+"-"+country+"-"+phone+"-"+email+"-"+address;
		   		    
		   		  }
		   		 
		   		 //TEXT QUESTIONS
		   		 if(questionType == 5){
		   			  
		   		   var value = $('.fullTextarea').val();
		   	      // alert('Text Area Value :' + questionIdAndType+"#"+value);
		   	      if(value)
		   	       url = url+"~"+questionIdAndType+"-"+value;
		   			
		   		  }
		   		 
		   		 //PHOTO UPLOAD QUESTIONS
		   		 if(questionType == 6){
		   			  
		   		  }
		   		 
		   		 
		   		 //LOCATION BASED QUESTIONS
		   		 if(questionType == 7){
		   			 
		   			var latvalue = document.getElementById("latitude").value;
				   // alert('Selected Option:' + questionIdAndType+"#"+latvalue);
				    var longvalue =document.getElementById("longitude").value;
				    //alert('Selected Option:' + questionIdAndType+"#"+longvalue);
				   if(latvalue && longvalue)
				    url = url+"~"+questionIdAndType+"-"+latvalue+"-"+longvalue;
		   			  
		   		  }
		   		 
		   		 
		   		 //DATETIME BASED QUESTIONS
		   		 if(questionType == 8){
		   			 
		   			 var dateTimeValue = document.getElementById("dateAnswer").value;
		   			 //alert('Date Based:' + questionIdAndType+"#"+dateTimeValue);
		   			 
		   		   if(dateTimeValue)
		   		     url = url+"~"+questionIdAndType+"-"+dateTimeValue;
				    
		   		  }
    			
			  
		   		
			
	 
	     }); 
	   		 
	   	    return false;   
			 

	   }); 		  
	     

	        //alert("url ::"+url);
	   	    document.submitAnswer.action = url;
			document.submitAnswer.submit();  	
		   
	     
  }
  
  
  
  </script>

</head>
<div class="wrapper">
	<s:form id="submitAnswer" name="submitAnswer" action="#" method="post">

         <!-------Multiple Choice Type Questions---------->
		 		 
		 <s:iterator value="listQuest" status="stat">
		 		 
		   <s:if test='%{questionType.getqTypeName() == "MULTIPLE CHOICE"}'>
		 
          <div class="row" id='<s:property value="%{id}" />-<s:property value="%{questionType.getId()}" />' >
        	<div class="listNumber" ><s:property value="#stat.index" /><%-- <s:property value="#stat.index" /> --%></div>
                <div class="imageUploadArea"></div>
          
            <div class="questionArea" >
            	<div class="question" id='<s:property value="%{questionType.getId()}" />'>	<s:property value="%{questionTitle}" />

				   <span class="mandatory">*</span>
				
				</div>
				   
				<s:iterator value="%{questionDAO.getQuestionMultipleAttributes(id)}">
				
					 <div class="inputElement" >
                         
                         <s:iterator value="%{answers.split('-')}" status="status" var="name">
						
					     	<input type="checkbox" class="checkboxinput" value='<s:property value="%{#name}" />' />  <s:property value="%{#name}"  /> </br></br>
						  
				
					 </s:iterator>
					 
					 
					 </div>
				</s:iterator>
				
            </div>           
              
              </div>
			  
			    </s:if>
         </s:iterator>
			
			
   <!-------Location Based Question Choice Type Questions---------->
		 
		 <s:iterator value="listQuest" status="stat">
		 
		   <s:if test='%{questionType.getqTypeName() == "LOCATION BASED QUESTIONS"}'>
		 
          <div class="row" id='<s:property value="%{id}" />-<s:property value="%{questionType.getId()}" />' >
        	<div class="listNumber"><s:property value="#stat.index" /></div>
                <div class="imageUploadArea"></div>
          
            <div class="questionArea">
            	<div class="question" id='<s:property value="%{questionType.getId()}" />'>	<s:property value="%{questionTitle}" /><span class="mandatory">*</span></div>
				   
				
					 <div class="inputElement">
                        
						Latitude<input type="text" id="latitude" name="latitude"   class="textBox" value=""  /> </br></br>
						Longitude<input type="text"  id="longitude" name="longitude"  class="textBox" value=""  /> </br></br>
						
					 
					 </div>	
				
            </div>           
              
              </div>
			  
			    </s:if>
         </s:iterator>
		 
		 
		 
		  <!-------Contact Based Question Choice Type Questions---------->
		 
		 <s:iterator value="listQuest" status="stat">
		 
		   <s:if test='%{questionType.getqTypeName() == "CONTACT QUESTIONS"}'>
		 
          <div class="row" id='<s:property value="%{id}" />-<s:property value="%{questionType.getId()}" />' >
        	<div class="listNumber"><s:property value="#stat.index" /></div>
                <div class="imageUploadArea"></div>
          
            <div class="questionArea">
            	<div class="question" id='<s:property value="%{questionType.getId()}" />'>	<s:property value="%{questionTitle}" /><span class="mandatory">*</span></div>
				   
				
					 <div class="inputElement">
                   
				    
						Enter Name<input type="text" name="name" id="name" class="textBox" value=""  /> </br></br>
						Enter City<input type="text" name="city" id="city" class="textBox" value=""  /> </br></br>
						Enter State<input type="text" name="state" id="state" class="textBox" value=""  /> </br></br>
						Enter ZipCode<input type="text" name="zipcode" id="zipcode" class="textBox" value=""  /> </br></br>
						Enter Country<input type="text" name="country" id="country" class="textBox" value=""  /> </br></br>
						Enter Phone<input type="text" name="phone" id="phone" class="textBox" value=""  /> </br></br>
						Enter Email<input type="text" name="email" id="email" class="textBox" value=""  /> </br></br>
						Enter Address<input type="text" name="address" id="address" class="textBox" value=""  /> </br></br>
						
			
				
				<br />
					 
					 </div>
				
            </div>           
              
              </div>
			  
			    </s:if>
         </s:iterator>
		 
			
			
			
			   <!-------Photo Based Question Choice Type Questions---------->
		 
		 <s:iterator value="listQuest" status="stat">
		 
		   <s:if test='%{questionType.getqTypeName() == "PHOTO UPLOAD QUESTIONS"}'>
		 
          <div class="row" id='<s:property value="%{id}" />-<s:property value="%{questionType.getId()}" />' >
        	<div class="listNumber"><s:property value="#stat.index" /></div>
                <div class="imageUploadArea"></div>
          
            <div class="questionArea">
            	<div class="question" id='<s:property value="%{questionType.getId()}" />'>	<s:property value="%{questionTitle}" /><span class="mandatory">*</span></div>
				   
				
					 <div class="inputElement">
                        
					  <div class="inputElement"><input type="file" class="uploadBtn" /></div>
					 
					 </div>
				
            </div>           
              
              </div>
			  
			    </s:if>
         </s:iterator>
		 
		 
		 
		 
	<!-------Text Based Question Choice Type Questions---------->
		 
		 <s:iterator value="listQuest" status="stat">
		 
		   <s:if test='%{questionType.getqTypeName() == "TEXT QUESTIONS"}'>
		 
          <div class="row" id='<s:property value="%{id}" />-<s:property value="%{questionType.getId()}" />' >
        	<div class="listNumber"><s:property value="#stat.index" /></div>
                <div class="imageUploadArea"></div>
          
            <div class="questionArea">
            	<div class="question" id='<s:property value="%{questionType.getId()}" />'>	<s:property value="%{questionTitle}" /><span class="mandatory">*</span></div>
				   
				
					 <div class="inputElement">
                        
						<textarea class="fullTextarea"></textarea>
					 
					 </div>
				
            </div>           
              
              </div>
			  
			    </s:if>
         </s:iterator>
		 
		 
		 
		 <!-------Date Time Based  Questions---------->
		 
		 <s:iterator value="listQuest" status="stat">
		 
		   <s:if test='%{questionType.getqTypeName() == "DATETIME BASED QUESTIONS"}'>
		 
          <div class="row" id='<s:property value="%{id}" />-<s:property value="%{questionType.getId()}" />' >
        	<div class="listNumber"><s:property value="#stat.index" /></div>
                <div class="imageUploadArea"></div>
          
            <div class="questionArea">
            	<div class="question" id='<s:property value="%{questionType.getId()}" />'>	<s:property value="%{questionTitle}" /><span class="mandatory">*</span></div>
				   
				
					 <div class="inputElement">
                        
						<input type="text" id="dateAnswer" name="dateAnswer" >
					 
					 </div>
				
            </div>           
              
              </div>
			  
			    </s:if>
         </s:iterator>
			
			
					 
	<!-------RATING SCALE Questions---------->
		 
		 <s:iterator value="listQuest" status="stat">
		 
		   <s:if test='%{questionType.getqTypeName() == "RATING SCALE"}'>
		 
          <div class="row" id='<s:property value="%{id}" />-<s:property value="%{questionType.getId()}" />' >
        	<div class="listNumber"><s:property value="#stat.count" /></div>
                <div class="imageUploadArea"></div>
          
            <div class="questionArea">
            	<div class="question" id='<s:property value="%{questionType.getId()}" />'>	<s:property value="%{questionTitle}" /><span class="mandatory">*</span></div>
				   
				
					 <div class="inputElement">
                        
						<div id="counter" ></div>
                               <p id="amount"></p>
					 
					 </div>
				
            </div>           
              
              </div>
			  
			    </s:if>
         </s:iterator>
			
			
			
			<!-------Ranking SCALE Questions---------->
		 
		 <s:iterator value="listQuest" status="stat">
		 
		   <s:if test='%{questionType.getqTypeName() == "RANKING QUESTIONS"}'>
		 
          <div class="row" id='<s:property value="%{id}" />-<s:property value="%{questionType.getId()}" />' >
        	<div class="listNumber"><s:property value="#itStatus.count" /></div>
                <div class="imageUploadArea"></div>
          
            <div class="questionArea">
            	<div class="question" id='<s:property value="%{questionType.getId()}" />'>	<s:property value="%{questionTitle}" /><span class="mandatory">*</span></div>
				   
			   <s:iterator value="%{questionDAO.getQuestionRankAttributes(id)}">
				
					 <div class="inputElement" >
                         
                         <s:iterator value="%{answers.split('-')}" status="status" var="name">
						
					     	<s:property value="%{#name}" />  <input type="text"  value=""  maxlength="4" size="2"/></br></br>
						  
				
					 </s:iterator>
					 
					 
					 </div>
				</s:iterator>
				
            </div>           
              
              </div>
			  
			    </s:if>
         </s:iterator>
			
			 <!--  <div class="row"> -->

                <div class="inputElement">
						<div align="right">
						  <input class="ui-button-text" type="button" value="Submit Answer" onclick="postAnswer()"/>
				          </div>
                </div>
      <!--   </div> -->
			
			
		
    </s:form>
</div>
<div id="mainFooter"></div>
