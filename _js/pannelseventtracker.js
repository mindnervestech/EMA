$(document).ready(function () {

    $(".qusTool .menu_item").draggable({helper: "clone"});
    $("#question_editor .placeholder").droppable({
        drop: function (event, ui) {
			element = ui.draggable.attr("id");
			var renderQues = "question_" + element + '()';
			renderQues = eval(renderQues);
			$('#empty').hide();
			$(this).append(renderQues);
			$("#question_editor .placeholder").find("section").addClass(element+"_section");	
            AddPoints();
        }
    });
	
    /*--------------------------------------Qustion panel insert delete--------------------------------------------*/
    $(".qusTool .menu_item").dblclick(function () {
        var element = $(this).attr("id");
		var renderQues = "question_" + element + '()';
		renderQues = eval(renderQues);		
		$('#empty').hide();
		$("#question_editor .placeholder").append(renderQues);
			
		$("#question_editor .placeholder").find("section").addClass(element+"_section");
		AddPoints();

        $( ".expiryDate" ).datepicker({ dateFormat: 'yy-mm-dd' }).val();

        $('.submitBtns.Add').click(function()
        {
            if( !$('.expiryDate').val() ) {
                  $('p.enterExpiryDate').css('display','block');
            }
        });

        $('.optional_text_note').change(function(){
        if (this.checked) {
           $('.hiddenAsteric').show();
        }
        else {
            $('.hiddenAsteric').hide();
        }                   
    });

        
    });
    /*--------------------------------------page tabs insert delete--------------------------------------------*/
    $("#qp_ad_del #qp_add").click(function () {
        $("#qedit_page_list .active").removeClass("active");
        $("#question_editor .active").removeClass("active");
        var list = $("#qedit_page_list li").length + 1;
        $("#qedit_page_list").append('<li class="active"><a href="#tabs' + list + '" data-toggle="tab">Page ' + list + '</a></li>');
        $("#question_editor").append('<div class="tab-pane active" id="tabs' + list + '"><div class="row-fluid panels se"></div></div>');
    });
    $("#qp_ad_del #qp_del").click(function () {
        if (($("#qedit_page_list li").length) >= 2) {
            var li_active = $("#qedit_page_list .active");
            var tab_active = $("#question_editor .active");
            li_active.prev().addClass("active");
            li_active.remove();
            tab_active.prev().addClass("active");
            tab_active.remove();

            $("#qedit_page_list li").each(function (index) {
                var number = index + 1;
                $("a", this).text("Page " + number);
                $("a", this).attr({
                    href: "#tabs" + number
                });
            });

            $("#question_editor .tab-pane").each(function (index) {
                var number = index + 1;
                $(this).attr({
                    id: "tabs" + number
                });
            });
        }
    });
    /*--------------------------------------panel height--------------------------------------------*/
});


function showEmptyPanle(){
	if($("#question_editor .placeholder").find("section").length != 1){
		$('#empty').hide();
	}else{
		$('#empty').show();
	}
}
function getValue(obj, key){
	var result;
	$.each(obj, function(i,e) {
		if (e.name == 'question') {
			result= this.value;
		}

	});
	return result;
}


function getOption1Value(obj, key){
	var result;
	$.each(obj, function(i,e) {
		if (e.name == 'text_opt_0') {
			result= this.value;
		}

	});
	return result;
}


function getOption2Value(obj, key){
	var result;
	$.each(obj, function(i,e) {
		if (e.name == 'text_opt_2') {
			result= this.value;
		}

	});
	return result;
}


function getOption3Value(obj, key){
	var result;
	$.each(obj, function(i,e) {
		if (e.name == 'text_opt_3') {
			result= this.value;
		}

	});
	return result;
}


function getOption4Value(obj, key){
	var result;
	$.each(obj, function(i,e) {
		if (e.name == 'text_opt_4') {
			result= this.value;
		}

	});
	return result;
}


function getQuestionType(obj, key){
	var result;
	$.each(obj, function(i,e) {
		if (e.name == 'typeOfQuestion') {
			result= this.value;
		}

	});
	return result;
}


function getQuestyionType(obj, key){
	var result;
	$.each(obj, function(i,e) {
		if (e.name == 'questionType') {
			result= this.value;
		}

	});
	return result;
}




function saveQuestion(formData){
	alert("Going to Save Events..");
    var url='submitquestion.action?questionTitle=';
	
	var fields = $(formData).serializeArray();
	$("#questionFormates").show().css({'min-height':50, 'background':'#fff', 'margin-bottom':'10px'});
	var title = getValue(fields,'question');
    var option1= getOption1Value(fields,'text_opt_0');
	var option2= getOption2Value(fields,'text_opt_2');
	var option3= getOption3Value(fields,'text_opt_3');
	var option4= getOption4Value(fields,'text_opt_4');
    var questionType = getQuestyionType(fields,'questionType');
    
    alert(option3);
   
    if(title){
    	url=url+title;
    }
    
    
    
     if(questionType && questionType=="muliplechoice")
        {
    	  
    	   if(option1 && option2){
    			url=url+"&answers="+option1+"-"+option2;
    	   }
    	   
    	   if(option3 && option4){
    		   url=url+"-"+option3+"-"+option4;
    	   }
    	    
    	   
    	   
        	var requesturl=url+"&questionTypeId=1&isRandomized=1";
        	
        	alert(requesturl);
            
        	$.ajax({
    		   	type: "POST",
    		   	url: requesturl,
    		    success: function(respText) {
                   
    		    	if(respText=='success'){
    		    		alert("Question added Succcessfully into Form..Please preview to see !");
    		    	}
    		    	
    		    	else{
    		    		alert("EMA Internal Server error.Please try again !");
    		    	}
    		    	
    		    	 formData.remove();
    		      }
    		
    		}); 
        }
     
     else if(questionType && questionType=="rankingScale")
     {

	      if(option1 && option2){
	   			url=url+"&answers="+option1+"-"+option2;
	   	   }
	   	   
	   	   if(option3 && option4){
	   		   url=url+"-"+option3+"-"+option4;
	   	   }
   	 
    	   var requesturl=url+"&questionTypeId=2&isRandomized=1";
    	   
    	   alert(requesturl);
    	   
         
     	$.ajax({
 		   	type: "POST",
 		   	url: requesturl,
 		    success: function(respText) {
                
 		    	if(respText=='success'){
 		    		alert("Question added Succcessfully into Form..Please preview to see !");
 		    	}
 		    	
 		    	else{
 		    		alert("EMA Internal Server error.Please try again !");
 		    	}
 		    	
 		    	 formData.remove();
 		      }
 		
 		}); 
     }
     
     
     else if(questionType && questionType=="contactBased")
     {
    	 var option5= getOption4Value(fields,'text_opt_5');
    	 var option6= getOption4Value(fields,'text_opt_6');
    	 var option7= getOption4Value(fields,'text_opt_7');
    	 var option8= getOption4Value(fields,'text_opt_8');
    	 var option9= getOption4Value(fields,'text_opt_9');
    
    	 
    	 if(!option1 && !option2 && !option3 && !option4 && !option5 && !option6 && !option7 && !option8 && !option9 ){
    		 
    		 alert("Please Select One visibility option !");
    		 return false;
    	 }
    	 
     	
     	if(option1){
     		 url=url+"&isNameVisible="+option1;
     	}
     	
		if(option2){
			 url=url+"&isAddressVisible="+option2;
	     	}
		
		if(option3){
			 url=url+"&isCityVisible="+option3;
	 	}
		
		if(option4){
			 url=url+"&isStateVisible="+option4;
	 	}
		
		if(option5){
			 url=url+"&isZipVisible="+option5;
	 	}
		
		if(option6){
			 url=url+"&isCountryVisible="+option6;
	 	}
		
		if(option7){
			 url=url+"&isEmailVisible="+option7;
	 	}
		
		if(option8){
			 url=url+"&isPhoneVisible="+option8;
	 	}
     	
     	
		var requesturl=url+"&questionTypeId=4&isRandomized=1";
		//alert(requesturl);
		
         
     	$.ajax({
 		   	type: "POST",
 		   	url: requesturl,
 		    success: function(respText) {
                
 		    	if(respText=='success'){
 		    		alert("Question added Succcessfully into Form..Please preview to see !");
 		    	}
 		    	
 		    	else{
 		    		alert("EMA Internal Server error.Please try again !");
 		    	}
 		    	
 		    	 formData.remove();
 		      }
 		
 		}); 
     }
     
     
     else if(questionType && questionType=="locationBased")
     {
     	var requesturl=url+"&questionTypeId=7&isRandomized=1";

     	$.ajax({
 		   	type: "POST",
 		   	url: requesturl,
 		    success: function(respText) {
                
 		    	if(respText=='success'){
 		    		alert("Question added Succcessfully into Form..Please preview to see !");
 		    	}
 		    	
 		    	else{
 		    		alert("EMA Internal Server error.Please try again !");
 		    	}
 		    	
 		    	 formData.remove();
 		      }
 		
 		}); 
     }
     
     
     else if(questionType && questionType=="dateTime")
     {
     	var requesturl=url+"&questionTypeId=8&isRandomized=1";

     	$.ajax({
 		   	type: "POST",
 		   	url: requesturl,
 		    success: function(respText) {
                
 		    	if(respText=='success'){
 		    		alert("Question added Succcessfully into Form..Please preview to see !");
 		    	}
 		    	
 		    	else{
 		    		alert("EMA Internal Server error.Please try again !");
 		    	}
 		    	
 		    	 formData.remove();
 		      }
 		
 		}); 
     }
     
     
     else if(questionType && questionType=="photoUpload")
     {
     	var requesturl=url+"&questionTypeId=6&isRandomized=1";
      
     	$.ajax({
 		   	type: "POST",
 		   	url: requesturl,
 		    success: function(respText) {
                
 		    	if(respText=='success'){
 		    		alert("Question added Succcessfully into Form..Please preview to see !");
 		    	}
 		    	
 		    	else{
 		    		alert("EMA Internal Server error.Please try again !");
 		    	}
 		    	
 		    	 formData.remove();
 		      }
 		
 		}); 
     }
     
     else if(questionType && questionType=="ratingScale")
     {
     	var requesturl=url+"&questionTypeId=3&isRandomized=1";
         
     	$.ajax({
 		   	type: "POST",
 		   	url: requesturl,
 		    success: function(respText) {
                
 		    	if(respText=='success'){
 		    		alert("Question added Succcessfully into Form..Please preview to see !");
 		    	}
 		    	
 		    	else{
 		    		alert("EMA Internal Server error.Please try again !");
 		    	}
 		    	
 		    	 formData.remove();
 		      }
 		
 		}); 
     }
     
     else if(questionType && questionType=="textBased")
     {
     	var requesturl=url+"&questionTypeId=5&isRandomized=1";
         
     	$.ajax({
 		   	type: "POST",
 		   	url: requesturl,
 		    success: function(respText) {
                
 		    	if(respText=='success'){
 		    		alert("Question added Succcessfully into Form..Please preview to see !");
 		    	}
 		    	
 		    	else{
 		    		alert("EMA Internal Server error.Please try again !");
 		    	}
 		    	
 		    	 formData.remove();
 		      }
 		
 		}); 
     }
     

//alert(selected);
}



/*--------------------------------------panel height--------------------------------------------*/
function AddPoints(){
	$("#question_editor .placeholder").find("section").each(function (index) {
		var number = 'Q' + index + 1;
		//$(".q", this).attr({id: "view_" + number });
		$(".q-edit", this).attr({id: "edit_" + number });
		$("form", this).attr({name: "FormSubmit_" + number });
		$(".Remove", this).attr({ onclick: "showEmptyPanle(); $('#edit_" + number + "').parent('section').remove(); addNumbering()"});
		$(".Add", this).attr({ onclick: "var im =$('#edit_" + number + "').find('form'); saveQuestion(im);"});
	});
	
	addNumbering();
	
	var count = 0;
	$("section").on("click", ".copy-qustion", function () {
		var style = $(this).parents("section").attr("class");
		var n = style.split(" ");
		$("#question_editor section").removeClass("current_panel");
		$(".panels-hide ." + n[1]).clone().addClass("current_panel").appendTo($(this).parents(".placeholder"));
		loaded_curent_panel();
		toggle_panel();
		edit_delete_control();
		media_upload_control();
	});
	$(".optional_text_note").click(function () {
            if ($(this).is(':checked')) {
                $(this).parents(".q-edit").find(".optional_note").show();
            } else {
                $(this).parents(".q-edit").find(".optional_note").hide();
            }
        });
	$(".mandatory_check").click(function () {
            if ($(this).is(':checked')) {
                $(this).parents(".q-edit").find(".optional_mandatory").show();
            } else {
                $(this).parents(".q-edit").find(".optional_mandatory").hide();
            }
        });
	$(".optional_other_opt").click(function () {
            if ($(this).is(':checked')) {
                $(this).parents(".q-edit").find(".edit-controls").show();
            } else {
                $(this).parents(".q-edit").find(".edit-controls").hide();
            }
        });
    $(".optional_coment_check").click(function () {
            if ($(this).is(':checked')) {
                $(this).parents(".q-edit").find(".optional_comments").show();
            } else {
                $(this).parents(".q-edit").find(".optional_comments").hide();
            }
        });
	$(".btn-group .visual-editor").click(function () {
            $(this).parents(".q-edit").find(".multi-edit-plain").hide();
            $(this).parents(".q-edit").find(".multi-edit-normal").show();
        });
    $(".btn-group .plain-editor").click(function () {
            $(this).parents(".q-edit").find(".multi-edit-normal").hide();
            $(this).parents(".q-edit").find(".multi-edit-plain").show();
        });
}

function addNumbering(){
	$("#question_editor .placeholder").find("section").each(function (index) {
		//var ql = $("#question_editor .placeholder").find("section.multiple_choice_section").size();
		//alert(ql);
		var number = index + 1;
		$(".q .number", this).text('Q' + number);
		$(".q-edit .number", this).text('Q' + number);
	});
}

$(".media-insert-").click(function () {
    $(this).popover({
        placement: '', //placement of the popover. also can use top, bottom, left or right
        title: '<div style="text-align:center; color:red; text-decoration:underline; font-size:14px;"> Muah ha ha</div>',
        html: 'true', //needed to show html of course
        content: function () {
            return $("#media_pop").load('file_maneger.html');
        } /*'<div id="popOverBox">ldfs gk;dsgj l;k</div>'*/
        //this is the content of the html box. add the image here or anything you want really.
    });});

function loaded_curent_panel() {
    $("section .q-edit").hide();
    $("section .q").show();
    $(".current_panel .q").hide();
    $(".current_panel .q-edit").show();}

function loaded_curent_dragpanel() {
    $("section .q-edit").hide();
    $("section .q").show();
    $(".current_panel .q").hide();
    $(".current_panel .q-edit").show();}

function toggle_panel() {

    $("section .q").click(function () {
        $("section .q-edit").hide();
        $("section .q").show();
        $(this).hide();
        $(this).next().show();
    });

    $("section .q-edit").dblclick(function () {
        $("section .q").hide();
        $("section .q-edit").show();
        $(this).hide();
        $(this).prev().show();
    });}

function edit_delete_control() {
    $(".q").mouseover(function () {
        $(this).find(".alighRightTop").show();
    });
    $(".q").mouseout(function () {
        $(this).find(".alighRightTop").hide();
    });
    $(".edit-qustion").click(function () {
        $("section .q-edit").hide();
        $("section .q").show();
        $(this).parents("section").find(".q").hide();
        $(this).parents("section").find(".q-edit").show();
    });
    $(".remove-qustion").click(function () {
        var obj = $(this);
        $("#myModal").modal('show');
        $("#myModal").find('.confirm').click(function () {
            $("#myModal").modal('hide');
            obj.parents(".question").remove();

            $("#question_editor section:not(.page_header_section)").each(function (index) {
                var number = index + 1;
                $(".q .number", this).text(number);
                $(".q-edit .number", this).text(number);
            });

        });
    });
    $(".remove-text-field").click(function () {
        $(this).parents(".multi-answer").hide();
    });}

function media_upload_control() {
    $(".q-edit-left .media-insert").click(function () {
        $(this).parents(".q-edit-left").find(".popover").remove();
        el = $(this);
        $.get("file_maneger.html", function (response) {
            el.unbind('click').popover({
                placement: 'left',
                content: response,
                title: '',
                html: true,
                delay: {
                    show: 100,
                    hide: 500
                }
            }).popover('show');
        });
    });}

$(".popover .media_pop_cancel").on("click", function () {
    $(this).parents(".popover").remove();
});


function addNewRow(self){
	var setOptId = $(self).closest('section').find('div:first-child').attr('id');
	var sizeOpt =$(self).closest('section').find('.optionRow .options').size();
	var html = '<div class="options" id="Option'+sizeOpt+'">'+
			'<input type="text" value="Option '+(sizeOpt + 1 )+'"'+' id="text_opt_'+sizeOpt+'_'+setOptId+'"'
			+' name="text_opt_'+(sizeOpt + 1 )+'" class="optionTextbox" />'
			/*+'<input type="button" class="submitBtns" value="Media" />'*/
			+'<input type="button" class="submitBtns remvRecord" value="delete" onclick="removeMe(this);" />'
			+'<label class="blockSection">'
		+'</div>';
	$(self).closest('section').find('.optionRow').append(html);
}

function removeMe(self){
	$(self).parent().remove();
}

/* Question htmls */
function question_multiple_choice() {
    multiChoicehtml = '<section class="question">' 
    +'<div id="edit_1" class="q-edit">'
    +'<form name="FormSubmit_1" class="FormSubmit" method="post" action="">'
    +'<div class="questionContainer">'
        +'<div class="q-edit-right rightSection">'
            +'<div class="q-options q-options-editor">'
/*                +'<label class="blockSection"><input type="checkbox" name="ian" class="checkboxsec mandatory_check" /> Include a Note </label>'
*/                +'<label class="blockSection"><input type="checkbox" name="qim" class="checkboxsec optional_text_note" /> Question is Mandatory </label>'
/*                +'<label class="blockSection"><input type="checkbox" name="io" class="checkboxsec optional_other_opt" /> Include "Other" Option </label>'
                +'<label class="blockSection"><input type="checkbox" name="iuc" class="checkboxsec optional_coment_check" /> Include User Comments </label>'
*/            +'</div>'
           /* +'<h6> Choice type</h6>'
            +'<select name="choice_type" class="rightSelectType">'
                +'<option value="0" selected="selected">Choose one (radio)</option>'
                +'<option value="1">Choose one (list)</option>'
                +'<option value="2">Choose many (check)</option>'
                +'<option value="3">Choose many (list)</option>'
            +'</select>'
            +'<h6> Order choices</h6>'
            +'<select name="order" class="rightSelectType">'
                +'<option value="0" selected="selected">As entered</option>'
                +'<option value="1">A-Z</option>'
                +'<option value="2">Z-A</option>'
                +'<option value="3">Random</option>'
            +'</select>'*/
            +'<div class="smallSpacer"></div>'
            +'<div class="alighBottom">'
                +'<input type="button" class="submitBtns Remove" value="Cancel" title="Cancel" />'
                +'<input type="button" class="submitBtns Add" value="Done" title="Done" />'
            +'</div>'
        +'</div>'
        +'<div class="leftSection">'
            +'<div class="quesNumber"><span class="number">Q1</span></div>'
            +'<div class="typeOfQuestion">Multiple Choice</div>'
            +'<div class="questionRow">'
                +'<input type="text" class="qTextBox" name="question" id="question" value="Please enter your question here." />'
               /* +'<input type="button" class="submitBtns" value="Media" />'*/
            +'</div>'
           /* +'<div class="alighLeft" id="editorOption">'
                +'<input type="button" class="editorBtns" value="Visual Editor" />'
                +'<input type="button" class="editorBtns" value="Plane Editor" />'
            +'</div>'*/
            +'<div class="optionRow">'
                +'<div class="options">'
                    +'<input type="text" value="Option 1" id="text_opt_0" name="text_opt_0" class="optionTextbox" />'
                  /*  +'<input type="button" class="submitBtns" value="Media" />'*/
                    +'<label class="blockSection">'
                    +'</label>'
                +'</div>'
                +'<div class="options">'
				    +'<input type="hidden" value="muliplechoice" id="questionType" name="questionType"  />'
                    +'<input type="text" value="Option 2" id="text_opt_1" name="text_opt_2" class="optionTextbox" />'
                 /*   +'<input type="button" class="submitBtns" value="Media" />'*/
                    +'<label class="blockSection">'
                    +'</label>'
                +'</div>'
            +'</div>'
 +'<div class="options">'
                    +'<label>Expiry Date</label><br>'
                    +'<input type="text" id="expiryDate1" name="expiryDate" class="optionTextbox expiryDate" />'
                    +'<p class="enterExpiryDate">Please enter expiry date</p>'
                +'</div>'
            +'<div class="optionRowBtn">'
                +'<input type="button" class="add_new_field submitBtns" onclick="addNewRow(this)" title="Add New Option" value="Add New Option" />'
            +'</div>'
        +'</div>'
    +'</div>'
    + '</form>'
    + '</div>'
    +'</section>';
    return multiChoicehtml;}
function question_ques_ranking() {
    rankSectionhtml = '<section id="" class="question">' 
    +'<div id="edit_1" class="q-edit">'
    +'<form name="FormSubmit_1" class="FormSubmit" method="post" action="">'
    +'<div class="questionContainer">'
        +'<div class="q-edit-right rightSection">'
            +'<div class="q-options q-options-editor">'
                +'<label class="blockSection"><input type="checkbox" name="qim" class="checkboxsec optional_text_note" /> Question is Mandatory </label>'
/*                +'<label class="blockSection"><input type="checkbox" name="ian" class="checkboxsec mandatory_check" /> Include a Note </label>'
*/				+'</div>'
          /*  +'<h6> Order choices</h6>'
            +'<select name="order" class="rightSelectType">'
                +'<option value="0" selected="selected">As entered</option>'
                +'<option value="1">A-Z</option>'
                +'<option value="2">Z-A</option>'
                +'<option value="3">Random</option>'
            +'</select>'*/
            +'<div class="smallSpacer"></div>'
            +'<div class="alighBottom">'
                +'<input type="button" class="submitBtns Remove" value="Cancel" title="Cancel" />'
                +'<input type="button" class="submitBtns Add" value="Done" title="Done" />'
            +'</div>'
        +'</div>'
        +'<div class="leftSection">'
            +'<div class="quesNumber"><span class="number">Q1</span></div>'
            +'<div class="typeOfQuestion">Ranking</div>'
            +'<div class="questionRow">'
                +'<input type="text" class="qTextBox" name="question" id="question" value="Please enter your question here." />'
             /*   +'<input type="button" class="submitBtns" value="Media" />'*/
            +'</div>'
           /* +'<div class="alighLeft" id="editorOption">'
                +'<input type="button" class="editorBtns" value="Visual Editor" />'
                +'<input type="button" class="editorBtns" value="Plane Editor" />'
            +'</div>'*/
            +'<div class="optionRow">'
                +'<div class="options">'
				    +'<input type="hidden" value="rankingScale" id="questionType" name="questionType"  />'
                    +'<input type="text" value="Option 1" id="text_opt_0" name="text_opt_0" class="optionTextbox" />'
                   /* +'<input type="button" class="submitBtns" value="Media" />'*/
                  /*  +'<label class="blockSection">'
                        +'<input type="radio" name="correct" value="" checked="checked">Correct Answer'
                    +'</label>'*/
                +'</div>'
                +'<div class="options">'
                    +'<input type="text" value="Option 2" id="text_opt_1" name="text_opt_2" class="optionTextbox" />'
                  /*  +'<input type="button" class="submitBtns" value="Media" />'*/
                  /*  +'<label class="blockSection">'
                        +'<input type="radio" name="correct" value="" checked="checked">Correct Answer'
                    +'</label>'*/
                    +'</div>'
                 +'<div class="options">'
                    +'<label>Expiry Date</label><br>'
                    +'<input type="text" id="expiryDate2" name="expiryDate" class="optionTextbox expiryDate" />'
                    +'<p class="enterExpiryDate">Please enter expiry date</p>'
                +'</div>'
                +'</div>'
            +'</div>'
            +'<div class="optionRowBtn">'
                +'<input type="button" class="add_new_field submitBtns" title="Add New Option" value="Add New Option" onclick="addNewRow(this)"/>'
            +'</div>'
        +'</div>'
    +'</div>'
    + '</form>'
    + '</div>'
    +'</section>';
    return rankSectionhtml;}
function question_ques_location() {
    chooseLocationHtml = '<section id="" class="question">' 
    +'<div id="edit_1" class="q-edit">'
    +'<form name="FormSubmit_1" class="FormSubmit" method="post" action="">'
    +'<div class="questionContainer">'
        +'<div class="q-edit-right rightSection">'
            +'<div class="q-options q-options-editor">'
                +'<label class="blockSection"><input type="checkbox" name="qim" class="checkboxsec optional_text_note" /> Question is Mandatory </label>'
/*                +'<label class="blockSection"><input type="checkbox" name="ian" class="checkboxsec mandatory_check" /> Include a Note </label>'
*/				+'</div>'
            +'<div class="smallSpacer"></div>'
            +'<div class="alighBottom">'
			    +'<input type="hidden" value="locationBased" id="questionType" name="questionType"  />'
                +'<input type="button" class="submitBtns Remove" value="Cancel" title="Cancel" />'
                +'<input type="button" class="submitBtns Add" value="Done" title="Done" />'
            +'</div>'
        +'</div>'
        +'<div class="leftSection">'
            +'<div class="quesNumber"><span class="number">Q1</span></div>'
            +'<div class="typeOfQuestion">Location</div>'
            +'<div class="questionRow">'
                +'<input type="text" class="qTextBox" name="question" id="question" value="Please enter your question here." />'
               /* +'<input type="button" class="submitBtns" value="Media" />'*/
            +'</div>'
+'<div class="questionRow">'
                    +'<label>Expiry Date</label><br>'
                    +'<input type="text" id="expiryDate3" name="expiryDate" class="optionTextbox expiryDate" />'
                    +'<p class="enterExpiryDate">Please enter expiry date</p>'
                +'</div>'
        +'</div>'
    +'</div>'
    + '</form>'
    + '</div>'
    +'</section>';
    return chooseLocationHtml;}
function question_ques_photoUpload() {
    photoUploadHtml = '<section id="" class="question">' 
    +'<div id="edit_1" class="q-edit">'
    +'<form name="FormSubmit_1" class="FormSubmit" method="post" action="">'
    +'<div class="questionContainer">'
        +'<div class="q-edit-right rightSection">'
            +'<div class="q-options q-options-editor">'
                +'<label class="blockSection"><input type="checkbox" name="qim" class="checkboxsec optional_text_note" /> Question is Mandatory </label>'
/*                +'<label class="blockSection"><input type="checkbox" name="ian" class="checkboxsec mandatory_check" /> Include a Note </label>'
*/				+'</div>'
            +'<div class="smallSpacer"></div>'
            +'<div class="alighBottom">'
			    +'<input type="hidden" value="photoUpload" id="questionType" name="questionType"  />'
                +'<input type="button" class="submitBtns Remove" value="Cancel" title="Cancel" />'
                +'<input type="button" class="submitBtns Add" value="Done" title="Done" />'
            +'</div>'
        +'</div>'
        +'<div class="leftSection">'
            +'<div class="quesNumber"><span class="number">Q1</span></div>'
            +'<div class="typeOfQuestion">Photo Upload</div>'
            +'<div class="questionRow">'
                +'<input type="text" class="qTextBox" name="question" id="question" value="Please enter your question here." />'
               /* +'<input type="button" class="submitBtns" value="Media" />'*/
            +'</div>'
+'<div class="questionRow">'
                    +'<label>Expiry Date</label><br>'
                    +'<input type="text" id="expiryDate4" name="expiryDate" class="optionTextbox expiryDate" />'
                    +'<p class="enterExpiryDate">Please enter expiry date</p>'
                +'</div>'
        +'</div>'
    +'</div>'
    + '</form>'
    + '</div>'
    +'</section>';
    return photoUploadHtml;}
function question_ques_fit() {
    TextQuesHtml = '<section id="" class="question">' 
    +'<div id="edit_1" class="q-edit">'
    +'<form name="FormSubmit_1" class="FormSubmit" method="post" action="">'
    +'<div class="questionContainer">'
        +'<div class="q-edit-right rightSection">'
            +'<div class="q-options q-options-editor">'
                +'<label class="blockSection"><input type="checkbox" name="qim" class="checkboxsec optional_text_note" /> Question is Mandatory </label>'
/*                +'<label class="blockSection"><input type="checkbox" name="ian" class="checkboxsec mandatory_check" /> Include a Note </label>'
*/				+'</div>'
            +'<h6> Input Size</h6>'
            +'<select name="choice_type" class="rightSelectType">'
                +'<option value="0" selected="selected">Small</option>'
                +'<option value="1">Medium</option>'
                +'<option value="2">Large</option>'
            +'</select>'
            +'<h6> File Type</h6>'
            +'<select name="order" class="rightSelectType">'
                +'<option value="0" selected="selected">Single Line</option>'
                +'<option value="1">Multi Line</option>'
                +'<option value="2">Password</option>'
            +'</select>'
			+'<div class="smallSpacer"></div>'
            +'<div class="alighBottom">'
			    +'<input type="hidden" value="textBased" id="questionType" name="questionType"  />'
                +'<input type="button" class="submitBtns Remove" value="Cancel" title="Cancel" />'
                +'<input type="button" class="submitBtns Add" value="Done" title="Done" />'
            +'</div>'
        +'</div>'
        +'<div class="leftSection">'
            +'<div class="quesNumber"><span class="number">Q1</span></div>'
            +'<div class="typeOfQuestion">Text</div>'
            +'<div class="questionRow">'
                +'<input type="text" class="qTextBox" name="question" id="question" value="Please enter your question here." />'
              /*  +'<input type="button" class="submitBtns" value="Media" />'*/
+'<div class="questionRow">'
                    +'<label>Expiry Date</label><br>'
                    +'<input type="text" id="expiryDate5" name="expiryDate" class="optionTextbox expiryDate" />'
                    +'<p class="enterExpiryDate">Please enter expiry date</p>'
            +'</div>'
            +'</div>'
        +'</div>'
    +'</div>'
    + '</form>'
    + '</div>'
    +'</section>';
    return TextQuesHtml;}
function question_ques_rating() {
    ratingHtml = '<section id="" class="question">' 
    +'<div id="edit_1" class="q-edit">'
    +'<form name="FormSubmit_1" class="FormSubmit" method="post" action="">'
    +'<div class="questionContainer">'
        +'<div class="q-edit-right rightSection">'
            +'<div class="q-options q-options-editor">'
                +'<label class="blockSection"><input type="checkbox" name="qim" class="checkboxsec optional_text_note" /> Question is Mandatory </label>'
               /* +'<label class="blockSection"><input type="checkbox" name="ian" class="checkboxsec mandatory_check" /> Include a Note </label>'*/
				+'</div>'
		  /* +'<h6> Input Size</h6>'
            +'<select name="choice_type" class="rightSelectType">'
                +'<option value="0" selected="selected">Small</option>'
                +'<option value="1">Medium</option>'
                +'<option value="2">Large</option>'
            +'</select>'
            +'<h6> File Type</h6>'
            +'<select name="order" class="rightSelectType">'
                +'<option value="0" selected="selected">Single Line</option>'
                +'<option value="1">Multi Line</option>'
                +'<option value="2">Password</option>'
            +'</select>'*/
			+'<div class="smallSpacer"></div>'
            +'<div class="alighBottom">'
			    +'<input type="hidden" value="ratingScale" id="questionType" name="questionType"  />'
                +'<input type="button" class="submitBtns Remove" value="Cancel" title="Cancel" />'
                +'<input type="button" class="submitBtns Add" value="Done" title="Done" />'
            +'</div>'
        +'</div>'
        +'<div class="leftSection">'
            +'<div class="quesNumber"><span class="number">Q1</span></div>'
            +'<div class="typeOfQuestion">Rating</div>'
            +'<div class="questionRow">'
                +'<input type="text" class="qTextBox" name="question" id="question" value="Please enter your question here." />'
                /*+'<input type="button" class="submitBtns" value="Media" />'*/
                +'<div class="optionRow">'
                +'<div class="options">'
                    +'<label>Min Rating Value<input type="text" value="" id="text_opt_0" name="text_opt_0" class="optionTextbox" /></label>'
                +'</div>'
                +'<div class="options">'
                    +'<label>Max Rating Value<input type="text" value="" id="text_opt_1" name="text_opt_2" class="optionTextbox" /></label>'
                +'</div>'
            +'</div>'
        +'</div>'
                
            +'</div>'
        +'</div>'
    +'</div>'
    + '</form>'
    + '</div>'
    +'</section>';
    return ratingHtml;}
function question_ques_dateTime() {
    dateTimeHtml = '<section id="" class="question">' 
    +'<div id="edit_1" class="q-edit">'
    +'<form name="FormSubmit_1" class="FormSubmit" method="post" action="">'
    +'<div class="questionContainer">'
        +'<div class="q-edit-right rightSection">'
            +'<div class="q-options q-options-editor">'
                +'<label class="blockSection"><input type="checkbox" name="qim" class="checkboxsec optional_text_note" /> Question is Mandatory </label>'
/*                +'<label class="blockSection"><input type="checkbox" name="ian" class="checkboxsec mandatory_check" /> Include a Note </label>'
*/				+'</div>'
           /* +'<h6> Input Size</h6>'
            +'<select name="choice_type" class="rightSelectType">'
                +'<option value="0" selected="selected">Small</option>'
                +'<option value="1">Medium</option>'
                +'<option value="2">Large</option>'
            +'</select>'
            +'<h6> File Type</h6>'
            +'<select name="order" class="rightSelectType">'
                +'<option value="0" selected="selected">Single Line</option>'
                +'<option value="1">Multi Line</option>'
                +'<option value="2">Password</option>'
            +'</select>'*/
			+'<div class="smallSpacer"></div>'
            +'<div class="alighBottom">'
			    +'<input type="hidden" value="dateTime" id="questionType" name="questionType"  />'
                +'<input type="button" class="submitBtns Remove" value="Cancel" title="Cancel" />'
                +'<input type="button" class="submitBtns Add" value="Done" title="Done" />'
            +'</div>'
        +'</div>'
        +'<div class="leftSection">'
            +'<div class="quesNumber"><span class="number">Q1</span></div>'
            +'<div class="typeOfQuestion">Date &amp Time</div>'
            +'<div class="questionRow">'
                +'<input type="text" class="qTextBox" name="question" id="question" value="Please enter your question here." />'
              /*  +'<input type="button" class="submitBtns" value="Media" />'*/
            +'</div>'
        +'</div>'
    +'</div>'
    + '</form>'
    + '</div>'
    +'</section>';
    return dateTimeHtml;}
function question_ques_contInfo() {
    contInfoHtml = '<section id="" class="question">' 
    +'<div id="edit_1" class="q-edit">'
    +'<form name="FormSubmit_1" class="FormSubmit" method="post" action="">'
    +'<div class="questionContainer">'
        +'<div class="q-edit-right rightSection">'
            +'<div class="q-options q-options-editor">'
                +'<label class="blockSection"><input type="checkbox" name="qim" class="checkboxsec optional_text_note" /> Question is Mandatory </label>'
/*                +'<label class="blockSection"><input type="checkbox" name="ian" class="checkboxsec mandatory_check" /> Include a Note </label>'
*/				+'</div>'
            /*+'<h6> Input Size</h6>'
            +'<select name="choice_type" class="rightSelectType">'
                +'<option value="0" selected="selected">Small</option>'
                +'<option value="1">Medium</option>'
                +'<option value="2">Large</option>'
            +'</select>'
            +'<h6> File Type</h6>'
            +'<select name="order" class="rightSelectType">'
                +'<option value="0" selected="selected">Single Line</option>'
                +'<option value="1">Multi Line</option>'
                +'<option value="2">Password</option>'
            +'</select>'*/
			+'<div class="smallSpacer"></div>'
            +'<div class="alighBottom">'
			    +'<input type="hidden" value="contactBased" id="questionType" name="questionType"  />'
                +'<input type="button" class="submitBtns Remove" value="Cancel" title="Cancel" />'
                +'<input type="button" class="submitBtns Add" value="Done" title="Done" />'
            +'</div>'
        +'</div>'
        +'<div class="leftSection">'
            +'<div class="quesNumber"><span class="number">Q1</span></div>'
            +'<div class="typeOfQuestion">Contact Info</div>'
            +'<div class="questionRow">'
                +'<input type="text" class="qTextBox" name="question" id="question" value="Please enter your question here." />'
              /*  +'<input type="button" class="submitBtns" value="Media" />'*/
                +'<div class="optionRow">'
                +'<div class="options">'
	                +'<span>Is Name Visible</span><br>'
					+' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>Yes <input type="radio" value="1" id="text_opt_2" name="text_opt_2" class="optionRadiobox" /></label>'
					 +'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>No<input type="radio" value="0" id="text_opt_2" name="text_opt_2" class="optionRadiobox" /></label> '
                +'</div>'
				+'<div class="options">'
				    +'<span>Is Address Visible</span><br>'
					+' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>Yes <input type="radio" value="1" id="text_opt_3" name="text_opt_3" class="optionRadiobox" /></label>'
					 +'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>No<input type="radio" value="0" id="text_opt_3" name="text_opt_3" class="optionRadiobox" /></label> '
				+'</div>'
				+'<div class="options">'
					+'<span>Is City Visible</span><br>'
					+' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>Yes <input type="radio" value="1" id="text_opt_4" name="text_opt_4" class="optionRadiobox" /></label>'
					 +'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>No<input type="radio" value="0" id="text_opt_4" name="text_opt_4" class="optionRadiobox" /></label> '
				+'</div>'
				+'<div class="options">'
					+'<span>Is State Visible</span><br>'
					+' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>Yes <input type="radio" value="1" id="text_opt_5" name="text_opt_5" class="optionRadiobox" /></label>'
					 +'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>No<input type="radio" value="0" id="text_opt_5" name="text_opt_5" class="optionRadiobox" /></label> '
				+'</div>'
				+'<div class="options">'
					+'<span>Is Zip Visible</span><br>'
					+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>Yes <input type="radio" value="1" id="text_opt_6" name="text_opt_6" class="optionRadiobox" /></label>'
					 +'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>No<input type="radio" value="0" id="text_opt_6" name="text_opt_6" class="optionRadiobox" /></label> '
				+'</div>'
				+'<div class="options">'
					+'<span>Is Country Visible</span><br>'
					+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>Yes <input type="radio" value="1" id="text_opt_7" name="text_opt_7" class="optionRadiobox" /></label>'
					 +'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>No<input type="radio" value="0" id="text_opt_7" name="text_opt_7" class="optionRadiobox" /></label> '
				+'</div>'
				+'<div class="options">'
					+'<span>Is Email Visible</span><br>'
					+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>Yes <input type="radio" value="1" id="text_opt_8" name="text_opt_8" class="optionRadiobox" /></label>'
					 +'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>No<input type="radio" value="0" id="text_opt_8" name="text_opt_8" class="optionRadiobox" /></label> '
				+'</div>'
				+'<div class="options">'
					+'<span>Is Phone Visible</span><br>'
					+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>Yes <input type="radio" value="1" id="text_opt_9" name="text_opt_9" class="optionRadiobox" /></label>'
					 +'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>No<input type="radio" value="0" id="text_opt_9" name="text_opt_9" class="optionRadiobox" /></label> '
			+'</div>'
				

            +'</div>'
                
            +'</div>'
+'<div class="questionRow">'
                    +'<label>Expiry Date</label><br>'
                    +'<input type="text" id="expiryDate8" name="expiryDate" class="optionTextbox expiryDate" />'
                    +'<p class="enterExpiryDate">Please enter expiry date</p>'
                +'</div>'
        +'</div>'
    +'</div>'
    + '</form>'
    + '</div>'
    +'</section>';
    return contInfoHtml;}