$(document).ready(function() {
    $('.submit-content').bind('click', function(event) {
        event.preventDefault();
        var content = $('.add-content').val();
        if (content == "") {
            alert("input content");
            return;
        }
        saveFollow(content);
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

function addFollowToCandidate(content, data) {
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
}

function saveFollow(content) {
    tokentag = $('#tokentag').val()

    $.ajax(window.location.pathname, {
        type:"put",
        data:{followContent:content, authenticity_token: tokentag},
        success: function(data) {
            addFollowToCandidate(content, data);
        }
    })
}