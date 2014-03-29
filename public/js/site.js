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
	setFormValues();
}
function setFormValues(){
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
function joinUp(){
	setFormValues();
	logFormSubmission();
	$('#paypal-form').submit();
}
function logFormSubmission(){
	//do an ajax call that chats with the back-end
}