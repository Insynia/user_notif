$('.user-notif, .small-user-notif').click((elem) ->
  $.ajax(url: $(this).data('url'), method: 'put').done () ->
    $(this).removeClass('unread')
)
