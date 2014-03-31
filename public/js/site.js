selectedOption = 'register'
function selectMenu(menuOption){
	selectedOption = menuOption;
	var match = 'ddm-join-'+menuOption;
	var match_form = menuOption+'-form'
	$('#ddm-join-type li').each(function(index, element){
		if($(this).attr('id')){
	    if($(this).attr('id') == match){
	      $(this).removeClass('active').addClass('active');
	      $('#dropdownMenuJoin .inner-content').html($('#'+match+' a').html())
	    } else {
	    	$(this).removeClass('active');
	    }
	  }
	})
	$('.join-form').each(function(index, element){
    if($(this).attr('id') == match_form){
      $(this).show();
    } else {
      $(this).hide();
    }
	})
	setPayPalFormValues();
}
function setPayPalFormValues(){
	switch(selectedOption){
  	case 'register':
  	  $('#paypal-button-id').val('VHZ9MFUHBBW7L');
      $('#paypal-name-id').val('Registrants');
      $('#paypal-value-id').val($('#'+selectedOption+'_selection').val());
  	break;
  	case 'sponsor':
  	  $('#paypal-button-id').val('2NKPTU6SM9K7S');
  	  $('#paypal-name-id').val('Sponsor Options');
  	  $('#paypal-value-id').val($('input[name="sponsor_selection"]:checked').val());
  	  break;
  	case 'lunch':
  	  $('#paypal-button-id').val('DQALYAQEKWXFQ');
  	  $('#paypal-name-id').val('Lunches');
  	  $('#paypal-value-id').val($('#'+selectedOption+'_selection').val());
  	  break;
  	case 'donate':
  	default:
      $('#paypal-button-id').val('S7P66PVP66D74');
  	  break;
  }
}
function validateName(allowEmpty){
	allowEmpty = (allowEmpty != null) ? allowEmpty : false;
	var valid = true;
	if($('#visitor-name').val() == '' && !allowEmpty){
    valid = false;
    $('#name-block').removeClass('has-success').addClass('has-error');
	} else {
		$('#name-block').removeClass('has-error').addClass('has-success');
	}
	return valid;
}
function validateEmail(allowEmpty){
	allowEmpty = (allowEmpty != null) ? allowEmpty : false;
	var valid = false;
	var email = $('#visitor-email').val();
	var longEnough = (email.length >= 5) ? true : false;
	var symbolPos = email.indexOf('@');
	var periodPos = -1;
	var domainLength = -1;
	if(symbolPos >= 1){
		periodPos = email.indexOf('.',symbolPos+1);
		if( (periodPos - symbolPos) > 1){
			domainLength = email.length - (periodPos + 1);
			//console.log(email.length+':'+periodPos+':'+domainLength);
			if(domainLength >= 2){
				valid = true;
			}
		}
	}
	//console.log(valid+' '+email+' @: '+symbolPos+' .:'+periodPos+' domain-length: '+domainLength+' str_length: '+email.length);
	if(!valid && !(email.length == 0 && allowEmpty)){
		$('#email-block').removeClass('has-success').addClass('has-error');
	} else {
		$('#email-block').removeClass('has-error').addClass('has-success');
	}
	return valid;
}
function validateNameAndEmail(allowEmpty){
	allowEmpty = (allowEmpty != null) ? allowEmpty : false;
	return (validateName(allowEmpty) && validateEmail(allowEmpty)) ? true : false;	
}
function joinUp(){
	setPayPalFormValues();
	if(validateNameAndEmail()){
  	logFormSubmission();
  	if($('#payment_type').val() == 'paypal'){
		  $('#paypal-form').submit();
		} else {
			//redirect to the 'check confirmation' page
			document.location = '/registration/check/confirmation';
		}
  }
}
function logFormSubmission(){
	//do an ajax call that chats with the back-end
	var name = $('#visitor-name').val();
	var email = $('#visitor-email').val();
	var type = $('#payment_type').val();
  console.log('log '+type+' for "'+name+'" - '+email);
}
$(function() {
	//validateNameAndEmail(true);
});