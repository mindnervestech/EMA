$(document).ready(function(){
						   
/*--------------------------------------Qustion panel insert delete--------------------------------------------*/

		$("#fl_menu .menu_item").click(function() {
				var element = $(this).attr("id");
				var addable = $(".panels-hide ."+element+"_section");
				
				$("#question_editor section").removeClass("current_panel");
				
				addable.clone().addClass("current_panel").appendTo("#question_editor .active .se");
				
				$("#question_editor .se section").each(function(index){
						var number = index+1;
					   $(".q", this).attr({id:"view_"+number});
					   $(".q-edit", this).attr({id:"edit_"+number});
					 });

				$("#question_editor .se section:not(.page_header_section)").each(function(index){
						var number = index+1;
					   $(".q .q-left .number", this).text(number);
					   $(".q-edit .q-left .number", this).text(number);
					 });
				
				loaded_curent_panel();
				toggle_panel();
				edit_delete_control();				
				media_upload_control();
				
				$(".cancel").click(function(){
					$(this).parents("q-edit").hide();
				});
				
				$("form").submit(function(){
					var text = $(".q-question input[type=text], this").val();
					if(text == ''){alert('asdsa');}
				});
				
				
				var count = 0;
				$( "section" ).on( "click", ".copy-qustion", function() {
					var style = $(this).parents("section").attr("class");
					var n=style.split(" ");
					$("#question_editor section").removeClass("current_panel");
  					$(".panels-hide ."+n[1]).clone().addClass("current_panel").appendTo($(this).parents(".se"));
					loaded_curent_panel();
					toggle_panel();
					edit_delete_control();				
					media_upload_control();
					
				}); 
				
				$(".optional_text_note").click(function() {
						if( $(this).is(':checked') ){
							$(this).parents(".q-edit").find(".optional_note").show();
						}else{
							$(this).parents(".q-edit").find(".optional_note").hide();	
						}
				});
				
				$(".mandatory_check").click(function() {
						if( $(this).is(':checked') ){
							$(this).parents(".q-edit").find(".optional_mandatory").show();
						}else{
							$(this).parents(".q-edit").find(".optional_mandatory").hide();	
						}
				});
				
				$(".optional_other_opt").click(function() {
						if( $(this).is(':checked') ){
							$(this).parents(".q-edit").find(".edit-controls").show();
						}else{
							$(this).parents(".q-edit").find(".edit-controls").hide();	
						}
				});
				
				$(".optional_coment_check").click(function() {
						if( $(this).is(':checked') ){
							$(this).parents(".q-edit").find(".optional_comments").show();
						}else{
							$(this).parents(".q-edit").find(".optional_comments").hide();	
						}
				});
				
				$(".btn-group .visual-editor").click( function(){
						$(this).parents(".q-edit").find(".multi-edit-plain").hide();							
						$(this).parents(".q-edit").find(".multi-edit-normal").show();
				});
				
				$(".btn-group .plain-editor").click( function(){							
						$(this).parents(".q-edit").find(".multi-edit-normal").hide();
						$(this).parents(".q-edit").find(".multi-edit-plain").show();
				});
				
				$(".btn-group .add_new_field").click( function(){
						var addable_list = $(this).parents(".multi-edit-normal").find("#hidden-text-fild li");
						addable_list.clone().appendTo($(this).parents(".multi-edit-normal").find("#contain-text-fild"));
						var number = $(this).parents(".multi-edit-normal").find("#contain-text-fild li").length;
						$(this).parents(".multi-edit-normal").find("#contain-text-fild li:last-child input[type=text]").val("Option "+number);

						$(this).parents(".multi-edit-normal").find("ul:first-child li").each(function(index){
							var number = index+1;						  
						   /*$("input[type=text]", this).val("Option "+number);*/
						   $("input[type=text]", this).attr({id:"text_opt_"+number});
						   $("input[type=text]", this).attr({name:"text_opt_"+number});
					 });
						
								$(".multi-edit-normal .remove-text-field").click( function(){

										var addable_list = $(this).parents(".add-answer");
										addable_list.remove();
										$(".multi-edit-normal ul:first-child li").each(function(index){
											var number = index+1;						  
										   /*$("input[type=text]", this).val("Option "+number);*/
										   $("input[type=text]", this).attr({id:"text_opt_"+number});
										   $("input[type=text]", this).attr({name:"text_opt_"+number});
									 });
						});
				});
				
			
				
		});
/*--------------------------------------page tabs insert delete--------------------------------------------*/
						   
		$("#qp_ad_del #qp_add").click(function() {
				$("#qedit_page_list .active").removeClass("active");
				$("#question_editor .active").removeClass("active");
				var list = $( "#qedit_page_list li" ).length+1;
			   $("#qedit_page_list").append('<li class="active"><a href="#tabs'+list+'" data-toggle="tab">Page '+list+'</a></li>');
			   $("#question_editor").append('<div class="tab-pane active" id="tabs'+list+'"><div class="row-fluid panels se"></div></div>');
			});
	
			 $("#qp_ad_del #qp_del").click(function() {	
			   if(($("#qedit_page_list li").length)>=2){
					var li_active = $("#qedit_page_list .active");
					var tab_active = $("#question_editor .active");
					  li_active.prev().addClass("active");
					  li_active.remove();
					  tab_active.prev().addClass("active");
					  tab_active.remove();
						
				   $("#qedit_page_list li").each(function(index){
						var number = index+1;						  
					   $("a", this).text("Page "+number);
					   $("a", this).attr({href:"#tabs"+number});
					 });
				   
				   $("#question_editor .tab-pane").each(function(index){
						var number = index+1;						  
					   $(this).attr({id:"tabs"+number});
					 });
			   }
		});
			 
				
/*--------------------------------------panel height--------------------------------------------*/	
	
	
});

/*--------------------------------------panel height--------------------------------------------*/	

$(document).ready(function(){
	
			$(".media-insert--").click(function() {
				$(".popover").hide();
			el = $(this);
			$.get("file_maneger.html", function(response) {
			  el.unbind('click').popover({
				placement : 'left',
				content: response,
				title: '',
				html: true,
				delay: {show: 500, hide: 100}
			  }).popover('show');
			});
		  });
				
});

/*-------------------------------------------------*/

	$(".media-insert-").click( function(){
			
			$(this).popover({
					placement : '', //placement of the popover. also can use top, bottom, left or right
					title : '<div style="text-align:center; color:red; text-decoration:underline; font-size:14px;"> Muah ha ha</div>', 				
					html: 'true', //needed to show html of course
					content : function() {
								 return $("#media_pop").load('file_maneger.html');
							 } /*'<div id="popOverBox">ldfs gk;dsgj l;k</div>'*/
					//this is the content of the html box. add the image here or anything you want really.
			});
	});
	
function loaded_curent_panel(){
				
				$("section .q-edit").hide();
				$("section .q").show();
				$(".current_panel .q").hide();
				$(".current_panel .q-edit").show();
				
	}

function toggle_panel(){
	
				$("section .q").click( function(){
				$("section .q-edit").hide();
				$("section .q").show();
				$(this).hide();
				$(this).next().show();
				});
				
				$("section .q-edit").dblclick( function(){
				$("section .q").hide();
				$("section .q-edit").show();
				$(this).hide();
				$(this).prev().show();
				});
				
	}
	
function edit_delete_control(){
				
				$(".q").mouseover(function(){
					$(this).find(".q-controls").show();								
				 });
				
				$(".q").mouseout(function(){
					$(this).find(".q-controls").hide();								
				 });
				
				/*-----------------------------------------*/
				
				$(".edit-qustion").click( function(){
					$("section .q-edit").hide();
					$("section .q").show();
					$(this).parents("section").find(".q").hide();
					$(this).parents("section").find(".q-edit").show();					
				});
				
				
				
							 
				 $(".remove-qustion").click(function() {
						var obj = $(this);							 
						$("#myModal").modal('show');
						$("#myModal").find('.confirm').click(function(){
							$("#myModal").modal('hide');									  
							obj.parents(".question").remove();
							
							$("#question_editor section:not(.page_header_section)").each(function(index){
								var number = index+1;						  
					   			$(".q .q-left .number", this).text(number);
					  		    $(".q-edit .q-left .number", this).text(number);
					        });
							
						});
				});
				 
				 
				 $(".remove-text-field").click(function() {
						$(this).parents(".multi-answer").hide();	
				});
				
	}

function media_upload_control(){
			
			/*$('.se:not(.popover)').on('click',function() {
				$(".popover").hide();
				});*/
				
				$(".q-edit-left .media-insert").click(function() {
				$(this).parents(".q-edit-left").find(".popover").remove();
				el = $(this);
				$.get("file_maneger.html", function(response) {
				  el.unbind('click').popover({
					placement : 'left',
					content: response,
					title: '',
					html: true,
					delay: {show: 100, hide: 500}
				  }).popover('show');
				});
			  });
	
	}
	
$(".popover .media_pop_cancel").on("click", function() {
	$(this).parents(".popover").remove();
});

$(document).ready(function(){
	
	$(".se .copy-qustion").on("click", function(){
			var addble = $(this).parents("section").attr("class");
			$(".panels-hide").find(".multiple_choice_section").clone().insertAfter($(this).parents("section"));
			$("#question_editor section:not(.page_header_section)").each(function(index){
						var number = index+1;						  
					   $(".q .q-left .number", this).text(number);
					  $(".q-edit .q-left .number", this).text(number);
			});
	});
	
});


