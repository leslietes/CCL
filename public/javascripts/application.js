// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery(document).ready(function(){
	$('#properties').dataTable({
		"aLengthMenu": [[-1, 10, 25, 50], ["All", 10, 25, 50]],
		"iDisplayLength": "-1"
	});
	$('#inquiries').dataTable();
	$('#subscriptions').dataTable();
	$('#gallery a').lightBox();
	
	$('.calendar').datepicker();
	$('.developer').accordion({
		"autoHeight": false
	});
	
	/* property page */
	$('a#floor_plans').click(function(){
		$('#floor_plans a').click();
		return false;
	});
	$('a#location_map').click(function(){
		$('#location_map a').click();
		return false;
	});
	$('#floor_plans a').lightBox();
	$('#location_map a').lightBox();
	
	$(".property a").tooltip();
	$("#gallery a").tooltip();
});


