

$(document).ready(function(){
	$("div.alert.alert-success,div.alert.alert-danger").click(function(){
		$(this).slideUp(1000,function(){
			$(this).remove();
		});
	})
});