$(document).ready(function() {
    $('#login_form').live('ajax:success', function(evt, data, status, xhr) {
            $('.login_popup').remove();
            $('#new_follow').submit();
            window.location = window.location
        }).live('ajax:error', function(evt, xhr, status, error) {
            if(xhr.status != '401') return;
            $('.login_popup').html(xhr.responseText)
        })
});