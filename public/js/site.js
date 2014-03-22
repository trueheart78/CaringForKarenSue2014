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
}
function joinUp(){
	//find out which form is visible, that's what they've chosen
	//then find out which item in the related
	var match_form = selectedOption+'-form'
	var data = jQuery('#'+match_form+' :input').serialize();
	alert(data);
  /*switch(selectedOption){
  	case 'register':
  	break
  	case ''
  }

	alert(selectedOption);*/
}