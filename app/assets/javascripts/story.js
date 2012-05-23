$(document).ready(function() {
    $('#new_follow').bind('ajax:beforeSend', function(evt, data, status, xhr) {
        if ($('.add-content').val() == "") {
            alert("input content");
            return false;
        }
    }).bind('ajax:success', function(evt, data, status, xhr) {
        content = $('.add-content').val()
        $('.story-added ul').prepend(
            "<li class='vote_wrap'>" +
            "   <p>" + content + "</p>" +
            "   <div>" +
            "       <span>投票</span>" +
            "       <span class='vote'>" +
            "           <input type='hidden' value='" + data + "' />" +
            "           <span>0</span>" +
            "       </span>" +
            "   </div>" +
            "</li>");
        $('.add-content').val("");
    });

    $('.vote').live('click', function() {
        console.log('ddd')
        addVote($(this))
    });
});

function addVote(follow) {
    var id = follow.find('input').val()
    tokentag = $('#tokentag').val()
    $.ajax("/follows/" + id, {
        type:"put",
        data:{authenticity_token: tokentag},
        success:function(data) {
            follow.find('span').text(Number(data));
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