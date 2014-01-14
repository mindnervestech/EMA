/*jQuery(document).ready(function() {
    jQuery('#mycarousel').jcarousel();
});*/
jQuery(document).ready(function() {
	$('.bs-docs-tooltip-examples a.tooltips').mouseover(function(){
		$(this).tooltip('show');
	});
	$('.bs-docs-tooltip-examples a.tooltips').mouseout(function(){
		$(this).tooltip('hide');
	});
});
jQuery(document).ready(function() {
	$('.bs-docs-tooltip-examples .btn').mouseover(function(){
		$(this).popover('show');
	});
	$('.bs-docs-tooltip-examples .btn').mouseout(function(){
		$(this).popover('hide');
	});
});

jQuery(document).ready(function() {
    
	jQuery(".media-insert").mouseover(function () {
												alert("asdfafafa sdfads");
		$(this).tooltip('show');	
    });
	jQuery(document).scroll(function () {
		$("#fixed").tooltip('hide');	
    });
	
	jQuery("#fixed").click(function () {
		$('body').toggleClass('background');	
    });
	
	jQuery("#create_new_folder").click(function(){
		$(this).tooltip('show');										
		$('#myModal').modal('show')
	});

 }); 
