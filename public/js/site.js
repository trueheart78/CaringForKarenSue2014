function selectMenu(menuOption){
	var match = 'ddm-join-'+menuOption;
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
}