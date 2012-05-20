$(document).ready(function() {
	$('.submit-new').on('click', function() {
        tokentag = $('#tokentag').val()
        comment = $(".follow_comment_textbox").val()
		if(comment == "") {	
			alert("先说点什么再提交吧")
			return false;
		}
		$.ajax(window.location.pathname, {
	        type:"post",
	        data:{'comment[content]':comment, 'follow_id':$('#follow_id').val()},
	        success: function(data) {
	            addCommentToCurrentPage(data);
	        }
	    })
	    return false
	});
})


function addCommentToCurrentPage(html) {
	if($('p.no_comments').length > 0) {
		$('p.no_comments').remove();
	}
	$('.comments').append(html)
}