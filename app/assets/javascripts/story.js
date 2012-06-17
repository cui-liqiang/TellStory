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

    $(".index-container .story-content").autobrowse({
        url: function (offset)
        {
            return "/stories/more?offset=OFFSET".replace(/OFFSET/, offset);
        },
        template: function (response)
        {
            return response;
        },
        itemsReturned: function (response) {
            var reg = /story clearfix/g;
            var match = response.match(reg);
            return match == null ? 0 : match.length
        },
        offset: 10,
        loader: '<div class="loader"></div>'
    });

    //retrieve hot people
    $.get("/hotest_users", function(data) {
        $('.hot-people').html(data)
    })
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