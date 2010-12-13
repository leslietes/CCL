// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery(document).ready(function(){
	$('#properties').dataTable({
		"aLengthMenu": [[-1, 10, 25, 50], ["All", 10, 25, 50]],
		"iDisplayLength": "-1"
	});
	$('#inquiries').dataTable({
		"aaSorting": [[4,"desc"]]
	});
	$('#subscriptions').dataTable();
	$('#gallery a').lightBox();
	
	$('.calendar').datepicker();
	$('.developer').accordion({
		"autoHeight": false
	});
	
	/* property page */ 
	$('a#studio_floor_plan').click(function(){
		$('#studio_floor_plan a').click();
		return false;
	});
	
	$('a#one_bedroom_floor_plan').click(function(){
		$('#one_bedroom_floor_plan a').click();
		return false;
	});
	
	$('a#two_bedroom_floor_plan').click(function(){
		$('#two_bedroom_floor_plan a').click();
		return false;
	});
	
	$('a#three_bedroom_floor_plan').click(function(){
		$('#three_bedroom_floor_plan a').click();
		return false;
	});
	
	$('a#penthouse_floor_plan').click(function(){
		$('#penthouse_floor_plan a').click();
		return false;
	});
	
	$('a#location_map').click(function(){
		$('#location_map a').click();
		return false;
	});
	
	$('a#property_photo').click(function(){
		$('#property_photo a').click();
		return false;
	});
	
	$('#studio_floor_plan a').lightBox();
	$('#one_bedroom_floor_plan a').lightBox();
	$('#two_bedroom_floor_plan a').lightBox();
	$('#three_bedroom_floor_plan a').lightBox();
	$('#penthouse_floor_plan a').lightBox();
	
	$('#location_map a').lightBox();
	$('#property_photo a').lightBox();
});


