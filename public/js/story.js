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
        var current = $(this).text();
        $(this).text(Number(current) + 1);
    });
});


function addFollowToCandidate(content) {
    $('.story-added ul').prepend(
            "<li>" +
            "   <p>" + content +
            "   </p>" +
            "   <div><span>投票</span><span class='vote'>0</span></div>" +
            "</li>");
    $('.add-content').val("");
}

function saveFollow(content) {
    $.ajax(window.location.pathname, {
        type:"put",
        data:{followContent:content},
        success: function() {
            addFollowToCandidate(content);
        }
    })
}