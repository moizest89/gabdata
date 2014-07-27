

$(document).ready(function(){
	$("div.alert.alert-success,div.alert.alert-danger").click(function(){
		$(this).slideUp(1000,function(){
			$(this).remove();
		});
	})
});


$(window).scroll(function() {
    var height = $(window).scrollTop();

    if(height  >= 100) {
        $("div.form_search_result").addClass("fixed");
    }else if(height  <= 199){
    	$("div.form_search_result").removeClass("fixed");
    }
});