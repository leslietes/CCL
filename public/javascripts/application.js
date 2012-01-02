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
	$('#pre_owned').dataTable();
	$('#rentals').dataTable();
		
	//$('#gallery a').lightBox();
	
	$('.calendar').datepicker();
	
	//$('.developer').accordion({
	//	"autoHeight": false
	//});
	
	/* property page 
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
	});*/ 
	
	//$('#studio_floor_plan a').lightBox();
	//$('#one_bedroom_floor_plan a').lightBox();
	//$('#two_bedroom_floor_plan a').lightBox();
	//$('#three_bedroom_floor_plan a').lightBox();
	//$('#penthouse_floor_plan a').lightBox();
	
	//$('#location_map a').lightBox();
	//$('#property_photo a').lightBox();
	
	// Get contact form and validate
	document.getElementsByTagName("form")[0].onsubmit = function() {
		var message = "";
		
		// Get full name field and check
		var name = document.getElementById("contact_name");
		if ( !validator.checkRequired(name) ) {
			message += "Full name is required.\n";
			//validator.alert(name, "Full name is required.");
			//return false;
		}
		
		// Get contact number field and check
		var contact_no = document.getElementById("contact_contact_no");
		if ( !validator.checkRequired(contact_no) ) {
			message += "Contact number is required.\n";
			//validator.alert(contact_no, "Contact number is required.");
			//return false;
		}
		
		// Get email address and check
		var email = document.getElementById("contact_email");
		if ( !validator.checkEmail(email) ) {
			message += "Valid email address is required.\n";
			//validator.alert(email, "Valid email address is required.");
			//return false;
		}
		
		//Get message and check
		var inquiry = document.getElementById("contact_message");
		if ( !validator.checkRequired(inquiry) ){
			message += "Message is required.";
			//validator.alert(message, "Message is required.");
			//return false;
		}
		
		if (message.length > 0) {
			alert(message);
			//$("<div id='errorExplanation' class='errorExplanation'>" + message + "</div>").insertBefore("#new_contact");
			return false;
		}
		
		
	}
});

var validator = {
	
	// Generic function to check if required input element is not blank
	checkRequired: function (elem) {
		//if (elem.type == "text")
			return elem.value.length > 0;
		//else
			//return elem.value.length > 0;
	},	
		
	checkEmail: function (elem) {
		return elem.value  != '' && /^[a-z0-9_+.-]+\@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/i.test( elem.value );
	}
	
	//alert: function(elem, msg) {
	//	alert(msg);
	//}
};


