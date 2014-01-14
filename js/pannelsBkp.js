$(document).ready(function () {

    $("#multCh").draggable({
        //appendTo: "body",
        helper: "clone"
    });
    $("#question_editor .placeholder").droppable({
        //accept: ":not(.ui-sortable-helper)",
        drop: function (event, ui) {
			var $clone = ui.helper.clone();
			
			//$(this).find(".placeholder").remove();
			//alert(ui.draggable.html());
			var element = $(this).attr("id");
			$('#empty').remove();
			var addable = $(".panels-hide ." + element + "_section");

			$("#question_editor section").removeClass("current_panel");
			addable.clone().addClass("current_panel").appendTo("#question_editor .placeholder");
			if($.trim($(this).text()).length != 0 ){
            $(this).append($clone.html());
			$('.placeholder #multiple_choice').remove();
			$('.placeholder .panels-hide').show();
			$("#question_editor section").removeClass("current_panel");
			var finalnumber ='';
			$("#question_editor .placeholder section").each(function (index) {
			
            var number = 'Q' + index + 1;
            $(".q", this).attr({
                id: "view_" + number
            });
            $(".q-edit", this).attr({
                id: "edit_" + number
            });
            $(".Cancel", this).attr({
                onclick: "$('#edit_" + number + "').remove()"
            });
			finalnumber =number;
			
        });
		$('#edit_'+finalnumber).parent().addClass('current_panel');
		$("#question_editor .placeholder section:not(.page_header_section)").each(function (index) {
            var number = index + 1;
            $(".q .number", this).text(number + ')');
            $(".q-edit .number", this).text('Q' + number);
        });

        loaded_curent_panel();
        toggle_panel();
        edit_delete_control();
        media_upload_control();
		}else{	
			$(this).html($clone.html());
			$('.placeholder').html($('.placeholder .panels-hide').html());
				$('.placeholder #edit_1').show();
				$("#question_editor .placeholder section").each(function (index) {
				var number = 'Q' + index + 1;
				$(".q", this).attr({
					id: "view_" + number
				});
				$(".q-edit", this).attr({
					id: "edit_" + number
				});
				$(".Cancel", this).attr({
                	onclick: "$('#edit_"+number+"').remove()"
            	});
				$(".Done", this).attr({
                	onclick: "$('#edit_"+number+"').remove()"
            	});
			});
			$("#question_editor .placeholder section:not(.page_header_section)").each(function (index) {
				var number = index + 1;
				$(".q .number", this).text('Q' + number);
				$(".q-edit .number", this).text('Q' + number);
			});
		}
		AddPoints();
		}
    })

    /*--------------------------------------Qustion panel insert delete--------------------------------------------*/

    $(".qusTool .menu_item").dblclick(function () {
        var element = $(this).attr("id");
		$('#empty').remove();
		var addable = $(".panels-hide ." + element + "_section");
        
		$("#question_editor section").removeClass("current_panel");
        addable.clone().addClass("current_panel").appendTo("#question_editor .placeholder");
        $("#question_editor .placeholder section").each(function (index) {
            var number = 'Q' + index + 1;
            $(".q", this).attr({
                id: "view_" + number
            });
            $(".q-edit", this).attr({
                id: "edit_" + number
            });
			
			$(".Cancel", this).attr({
                onclick: "$('#edit_"+number+"').remove()"
            });
        });

        $("#question_editor .placeholder section:not(.page_header_section)").each(function (index) {
            var number = index + 1;
            $(".q .number", this).text('Q' + number);
            $(".q-edit .number", this).text('Q' + number);
        });

        loaded_curent_panel();
        toggle_panel();
        edit_delete_control();
        media_upload_control();

		AddPoints();
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

/*--------------------------------------panel height--------------------------------------------*/
function AddPoints(){
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
		$(".add_new_field").click(function () {
				var sizeOpt =$('.placeholder .optionRow .options').size();
				var html = '<div class="options" id="Option'+sizeOpt+'">'+
						'<input type="text" value="Option '+(sizeOpt + 1 )+'"'+' id="text_opt_'+sizeOpt+'"'
						+' class="optionTextbox" />'
						+'<input type="button" class="submitBtns" value="Media" />'
						+'<input type="button" class="submitBtns remvRecord" value="delete" onclick="$(\'#Option'+sizeOpt+'\').remove();" />'
						+'<label class="blockSection">'
							+'<input type="radio" name="correct" value="" checked="checked">Correct Answer</label>'
					+'</div>';
				$('.placeholder .optionRow').append(html);
											
            $(".multi-edit-normal .remove-text-field").click(function () {

                var addable_list = $(this).parents(".add-answer");
                addable_list.remove();
                $(".multi-edit-normal ul:first-child li").each(function (index) {
                    var number = index + 1;
                    /*$("input[type=text]", this).val("Option "+number);*/
                    $("input[type=text]", this).attr({
                        id: "text_opt_" + number
                    });
                    $("input[type=text]", this).attr({
                        name: "text_opt_" + number
                    });
                });
            });
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
		        $(".cancel").click(function () {
            $(this).parents("q-edit").hide();
        });

        $("form").submit(function () {
            var text = $(".q-question input[type=text], this").val();
            if (text == '') {
                alert('asdsa');
            }
        });


	}




$(document).ready(function () {

    $(".media-insert--").click(function () {
        $(".popover").hide();
        el = $(this);
        $.get("file_maneger.html", function (response) {
            el.unbind('click').popover({
                placement: 'left',
                content: response,
                title: '',
                html: true,
                delay: {
                    show: 500,
                    hide: 100
                }
            }).popover('show');
        });
    });
});

/*-------------------------------------------------*/

$(".media-insert-").click(function () {

    $(this).popover({
        placement: '', //placement of the popover. also can use top, bottom, left or right
        title: '<div style="text-align:center; color:red; text-decoration:underline; font-size:14px;"> Muah ha ha</div>',
        html: 'true', //needed to show html of course
        content: function () {
            return $("#media_pop").load('file_maneger.html');
        } /*'<div id="popOverBox">ldfs gk;dsgj l;k</div>'*/
        //this is the content of the html box. add the image here or anything you want really.
    });
});

function loaded_curent_panel() {

    $("section .q-edit").hide();
    $("section .q").show();
    $(".current_panel .q").hide();
    $(".current_panel .q-edit").show();

}


function loaded_curent_dragpanel() {

    $("section .q-edit").hide();
    $("section .q").show();
    $(".current_panel .q").hide();
    $(".current_panel .q-edit").show();

}

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
    });

}

function edit_delete_control() {

    $(".q").mouseover(function () {
        $(this).find(".alighRightTop").show();
    });

    $(".q").mouseout(function () {
        $(this).find(".alighRightTop").hide();
    });

    /*-----------------------------------------*/

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
    });

}

function media_upload_control() {

    /*$('.placeholder:not(.popover)').on('click',function() {
				$(".popover").hide();
				});*/

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
    });

}

$(".popover .media_pop_cancel").on("click", function () {
    $(this).parents(".popover").remove();
});
/*function displayVals() {
	var question = $('#question').val();
	var opt1 = $('#text_opt_1').val();
	var opt2 = $('#text_opt_2').val();
	
}*/
$(document).ready(function () {

    $(".placeholder .copy-qustion").on("click", function () {
        var addble = $(this).parents("section").attr("class");
        $(".panels-hide").find(".multiple_choice_section").clone().insertAfter($(this).parents("section"));
        $("#question_editor section:not(.page_header_section)").each(function (index) {
            var number = index + 1;
            $(".q .number", this).text(number);
            $(".q-edit .number", this).text(number);
        });
    });

});