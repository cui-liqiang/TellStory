$(document).ready ->
  $("#new_comment").bind("ajax:beforeSend", (evt, data, status, xhr) ->
    comment = $(".follow_comment_textbox").val()
    if comment is ""
      alert "先说点什么再提交吧"
      false
  ).bind "ajax:success", (evt, data, status, xhr) ->
    $("p.no_comments").remove()  if $("p.no_comments").length > 0
    $(".comments").append data
    $(".follow_comment_textbox").val ""
