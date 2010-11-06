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
});
