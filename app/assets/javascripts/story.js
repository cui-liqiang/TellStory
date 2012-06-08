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
    }).bind('ajax:error', function(evt, xhr, status, error) {
        if(xhr.status != '401') return;
        var x=window.confirm("提交需要登陆。点击确定使用本站账号或者weibo账号登陆")
        if(x) {
            showLoginDialog(xhr.responseText)
        }
    })
});

function showLoginDialog(login_html) {
    $('body').append("<div class='login_popup'></div>");
    $('.login_popup').append(login_html);
    $('.login_popup').dialog({
        width: 500,
        modal: true,
        draggable: true,
        title: '登陆',
        close: function(event, ui) {
            $('.login_popup').remove();
        }
    });
}

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
                width: 500,
                modal: true, 
                draggable: true,
                title: '该续写的评论',
                close: function(event, ui) {
                    $('.for_popup').remove();
                }
            });
        }
    })
}