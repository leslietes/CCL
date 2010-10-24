// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery(document).ready(function(){
	$('#s3slider').s3Slider({
		timeOut: 2000
	});
	
	$('#properties').dataTable();
	$('#inquiries').dataTable();
	
	$('#accordion').hoverAccordion();
	$('#developers_accordion').hoverAccordion();
});
