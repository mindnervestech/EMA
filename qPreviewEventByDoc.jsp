<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="s" uri="/struts-tags"%> 
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
    	<a href="doctorHome.jsp" class="menuBtns"><div class="dashboard">Dashboard</div></a>
        <a href="doctorHome.jsp"  class="menuBtns"><!-- Forms --></a>
        <a href="#" class="menuBtns"><div class="help"><!-- People --></div></a>
     
       <!--  <a href="#"  class="addGreenBtn">New Study</a> -->
    </div>
    <div class="contentSection">
      <div class="sectionMenu"> <a href="newQuestionnaire.jsp" >Form Setting</a> <a href="qPageDevEvent.jsp">Form Construction</a> <a href="showEventByDoctor"  class="active">Preview</a> <a href="Distribute_DistributeGroupView">Distribute</a> </div>
<div class="contentData">
            <h2 class="heading">Form Name: <%=(String)request.getSession().getAttribute("surveyName") %> </h2>
            <p class="heading">
			<img src="upload/forms/<s:property value="%{questionnaireId}"/>.jpg" width="100" height="80" />
      <s:property value="%{questionnaireDesc}"/>
      <a href="qPage.jsp"></a></p>
            <p class="heading">&nbsp;</p>
            <p class="heading">&nbsp;</p>
            <div class="wrapper">
	<s:form id="submitAnswer" action="#" method="post">

         <!-------Multiple Choice Type Questions---------->
		 
		 <s:iterator value="listQuest" status="stat">
		 
		   <s:if test='%{questionType.getqTypeName() == "MULTIPLE CHOICE"}'>
		 
          <div class="row" id='<s:property value="#stat.index" />' >
        	<div class="listNumber" ><%-- <s:property value="#stat.index" /> --%></div>
                <div class="imageUploadArea"></div>
          
            <div class="questionArea" >
            	<div class="question" id='<s:property value="%{questionType.getqTypeName()}" />'>	<s:property value="%{questionTitle}" />

				  <%--  <span class="mandatory">*</span> --%>
				
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
		 
          <div class="row">
        	<div class="listNumber"><%-- <s:property value="#stat.index+1" /> --%></div>
                <div class="imageUploadArea"></div>
          
            <div class="questionArea">
            	<div class="question" id='<s:property value="%{questionType.getqTypeName()}" />'>	<s:property value="%{questionTitle}" /><span class="mandatory">*</span></div>
				   
				
					 <div class="inputElement">
                        
						Latitude<input type="text" class="textBox" value=""  /> </br></br>
						Longitude<input type="text" class="textBox" value=""  /> </br></br>
					 
					 </div>
				
            </div>           
              
              </div>
			  
		    </s:if>
         </s:iterator>
		 
		 
		 
		  <!-------Contact Based Question Choice Type Questions---------->
		 
		 <s:iterator value="listQuest" status="stat">
		 
		   <s:if test='%{questionType.getqTypeName() == "CONTACT QUESTIONS"}'>
		 
          <div class="row">
        	<div class="listNumber"><%-- <s:property value="#stat.index+1" /> --%></div>
                <div class="imageUploadArea"></div>
          
            <div class="questionArea">
            	<div class="question" id='<s:property value="%{questionType.getqTypeName()}" />'>	<s:property value="%{questionTitle}" /><span class="mandatory">*</span></div>
				   
				
					 <div class="inputElement">
                   
				    
						Enter Name<input type="text" class="textBox" value=""  /> </br></br>
						Enter City<input type="text" class="textBox" value=""  /> </br></br>
						Enter State<input type="text" class="textBox" value=""  /> </br></br>
						Enter PinCode<input type="text" class="textBox" value=""  /> </br></br>
						Enter ZipCode<input type="text" class="textBox" value=""  /> </br></br>
						Enter Country<input type="text" class="textBox" value=""  /> </br></br>
						Enter Phone<input type="text" class="textBox" value=""  /> </br></br>
						Enter Email<input type="text" class="textBox" value=""  /> </br></br>
						Enter Address<input type="text" class="textBox" value=""  /> </br></br>
						
			
				
				<br />
					 
					 </div>
				
            </div>           
              
              </div>
			  
		    </s:if>
         </s:iterator>
		 
			
			
			
			   <!-------Photo Based Question Choice Type Questions---------->
		 
		 <s:iterator value="listQuest" status="stat">
		 
		   <s:if test='%{questionType.getqTypeName() == "PHOTO UPLOAD QUESTIONS"}'>
		 
          <div class="row">
        	<div class="listNumber"><%-- <s:property value="#stat.index+1" /> --%></div>
                <div class="imageUploadArea"></div>
          
            <div class="questionArea">
            	<div class="question" id='<s:property value="%{questionType.getqTypeName()}" />'>	<s:property value="%{questionTitle}" /><span class="mandatory">*</span></div>
				   
				
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
		 
          <div class="row">
        	<div class="listNumber"><%-- <s:property value="#stat.index+1" /> --%></div>
                <div class="imageUploadArea"></div>
          
            <div class="questionArea">
            	<div class="question" id='<s:property value="%{questionType.getqTypeName()}" />'>	<s:property value="%{questionTitle}" /><span class="mandatory">*</span></div>
				   
				
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
		 
          <div class="row">
        	<div class="listNumber"><%-- <s:property value="#stat.index+1" /> --%></div>
                <div class="imageUploadArea"></div>
          
            <div class="questionArea">
            	<div class="question" id='<s:property value="%{questionType.getqTypeName()}" />'>	<s:property value="%{questionTitle}" /><span class="mandatory">*</span></div>
				   
				
					 <div class="inputElement">
                        
						<div class="dateCol">
                    	DD
                        <select class="DateSelect">
                        	<option>01</option>
                            <option>02</option>
                            <option>03</option>
							<option>04</option>
							<option>05</option>
							<option>06</option>
							<option>07</option>
							<option>08</option>
							<option>09</option>
							<option>10</option>
							<option>11</option>
							<option>12</option>
							<option>13</option>
							<option>14</option>
							<option>15</option>
							<option>16</option>
							<option>17</option>
							<option>18</option>
							<option>19</option>
							<option>20</option>
							<option>21</option>
							<option>22</option>
							<option>23</option>
							<option>24</option>
							<option>25</option>
							<option>26</option>
							<option>27</option>
							<option>28</option>
							<option>29</option>
							<option>30</option>
							<option>31</option>
                        </select>
                    </div>
                    <div class="dateCol">
                    	MM
                        <select name="select" class="DateSelect">
                          <option>Jan</option>
                          <option>Feb</option>
                          <option>Mar</option>
                          <option>April</option>
                          <option>May</option>
                          <option>June</option>
                          <option>July</option>
                          <option>August</option>
                          <option>Sep</option>
                          <option>Oct</option>
                          <option>Nov</option>
                          <option>Dec</option>
                        </select>
                    </div>
                    <div class="dateCol last">
                    	YYYY
                        <input type="text" class="textBox" size="5"/>
                    </div>
					 
					 </div>
				
            </div>           
              
              </div>
			  
		    </s:if>
         </s:iterator>
			
			
					 
	<!-------RATING SCALE Questions---------->
		 
		 <s:iterator value="listQuest" status="stat">
		 
		   <s:if test='%{questionType.getqTypeName() == "RATING SCALE"}'>
		 
          <div class="row">
        	<div class="listNumber"><%-- <s:property value="#stat.index+1" /> --%></div>
                <div class="imageUploadArea"></div>
          
            <div class="questionArea">
            	<div class="question" id='<s:property value="%{questionType.getqTypeName()}" />'>	<s:property value="%{questionTitle}" /><span class="mandatory">*</span></div>
				   
				
					 <div class="inputElement">
                        
						<div id="counter"></div>
                               <p id="amount"></p>
					 
					 </div>
				
            </div>           
              
              </div>
			  
		    </s:if>
         </s:iterator>
			
			
			
			<!-------Ranking SCALE Questions---------->
		 
		 <s:iterator value="listQuest" status="stat">
		 
		   <s:if test='%{questionType.getqTypeName() == "RANKING QUESTIONS"}'>
		 
          <div class="row">
        	<div class="listNumber"><s:property value="#stat.index+1" /></div>
                <div class="imageUploadArea"></div>
          
            <div class="questionArea">
            	<div class="question" id='<s:property value="%{questionType.getqTypeName()}" />'>	<s:property value="%{questionTitle}" /><span class="mandatory">*</span></div>
				   
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
			
			  <div class="row">

                <div class="inputElement">
						<div align="right">
						 <!--  <input class="ui-button-text" type="button" value="Submit Answer" onclick="postAnswer()"/> -->
		          </div>
                </div>
        </div>
			
			
		
    </s:form>
</div>
            <div class="contentFooterArea">
            	<a href="#" class="blueBtn"></a>            </div>
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
