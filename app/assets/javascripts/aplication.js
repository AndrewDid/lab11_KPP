$(document).ready(function(){
	$('#resultbutton').on('click', function(){
		$.ajax({
			url: "url",
			type: "TYPE",
			success: function(r){}
		});
	});
});
