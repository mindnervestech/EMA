<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>  
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%> 
<%@ taglib prefix="sjc" uri="/struts-jquery-chart-tags"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
   "http://www.w3.org/TR/html4/loose.dtd"> 

<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; 
charset=UTF-8"> 
        <title>Billability Report</title> 
        <link rel="stylesheet" type="text/css" href="lingostyle.css" />
    </head> 
    <body> 
        <h1>Billability Report Output in Table Format</h1> 
        <s:actionerror /> 
        <s:if test="warning == true"> 
            WARNING! Some hours in this report have no billable 
status. 
        </s:if> 
        <s:form > 
        <sj:head/>
            <sjc:chart 
                id="chartPie" 
                cssStyle="width: 600px; height: 400px;" 
                pie="true" 
                pieLabel="true" 
            > 
                <sjc:chartData 
                        id="pieSerie1" 
                        label="Serie 1" 
                        data="10" 
                /> 
                <sjc:chartData 
                        id="pieSerie2" 
                        label="Serie 2" 
                        data="3" 
                /> 
                <sjc:chartData 
                        id="pieSerie3" 
                        label="Serie 3" 
                        data="17" 
                /> 
                <sjc:chartData 
                        id="pieSerie4" 
                        label="Serie 4" 
                        data="37" 
                /> 
            </sjc:chart> 
          
            <br/> 
            <s:submit  action="nextReport" value="Create Another 
Report" align="left" /> 
            <s:submit  action="logout" value="Logout" align="left" /> 
        </s:form> 
    </body> 
</html> 