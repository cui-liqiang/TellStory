$(document).ready ->
  $('#new_follow').bind 'ajax:beforeSend', (evt, data, status, xhr) ->
    if $('.add-content').val() is ""
      alert 'input content'
      false
  .bind 'ajax:succes', (evt, data, status, xhr) ->
    $('.story-added ul').prepend data
    $('.add-content').val ""

  $('.index-container .story-content').autobrowse
    url: (offset) ->
      "/stories/more?offset=OFFSET".replace /OFFSET/, offset
    template: (response) ->
      response
    itemReturned: (response) ->
      match = response.match /story clearfix/g
      if match then match.lenght else 0
    offset: 10
    loader: '<div class="loader"></div>'

  $.get '/hotest_users', (data) ->
    $('.hot-people').html data

addVote = (story_id, follow_id) ->
  tokentag = $('#tokentag').val()
  $.ajax "/stories/" + story_id + "/follows/" + follow_id,
    type: "put"
    data:
      authenticity_token: tokentag
      success: (data) ->
        $('#vote_for_follow_' + follow_id).find('span').text(Number(data));
      error: (data) ->
        alert data.responseText

showCommentsBox = (story_id, follow_id) ->
  $ajax "/stories/" + story_id + "/follows/" + follow_id + "/comments",
    success: (html) ->
      $('body').append "<div class='for_popup'></div>"
      $('.for_popup').append html
      $('.for_popup').dialog
        width: 500
        modal: true
        draggable: true
        title: '该续写的评论'
        close: (event, ui) ->
          $('.for_popup').remove()
