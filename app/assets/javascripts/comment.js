$(document).ready(function() {
	$('#new_comment').bind('ajax:beforeSend', function(evt, data, status, xhr) {
		comment = $(".follow_comment_textbox").val()
		if(comment == "") {	
			alert("先说点什么再提交吧")
			return false;
		}
	}).bind('ajax:success', function(evt, data, status, xhr) {
		if($('p.no_comments').length > 0) {
			$('p.no_comments').remove();
		}
		$('.comments').append(data)
	})
})

