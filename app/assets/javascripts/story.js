$(document).ready(function() {
    $('#new_follow').bind('ajax:beforeSend', function(evt, data, status, xhr) {
        if ($('.add-content').val() == "") {
            alert("input content");
            return false;
        }
    }).bind('ajax:success', function(evt, data, status, xhr) {
        content = $('.add-content').val()
        $('.story-added ul').prepend(data);
        $('.add-content').val("");
    });

});

function addVote(story_id, follow_id) {
    tokentag = $('#tokentag').val()
    $.ajax("/stories/" + story_id + "/follows/" + follow_id, {
        type:"put",
        data:{authenticity_token: tokentag},
        success:function(data) {
            $('#vote_for_follow_' + follow_id).find('span').text(Number(data));
        },
        error:function(data) {
            alert(data.responseText)
        }
    })
}

function showCommentsBox(story_id, follow_id) {
    $.ajax("/stories/" + story_id + "/follows/" + follow_id + "/comments", {
        success: function(html) {
            $('body').append("<div class='for_popup'></div>");
            $('.for_popup').append(html);
            $('.for_popup').dialog({ 
                modal: true, 
                draggable: true, 
                resizable: true, 
                title: '该续写的评论',
                close: function(event, ui) {
                    $('.for_popup').remove();
                }
            });
            $('.ui-widget-overlay').attr('style', 'height: 700px; position:absolute;top:0');
        }
    })
}