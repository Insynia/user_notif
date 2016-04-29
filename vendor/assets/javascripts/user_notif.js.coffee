$ ->
  $('.user-notif, .small-user-notif').click(() ->
    elem = this
    $.ajax(url: $(this).data('url'), method: 'put').done () ->
      $(elem).removeClass('unread')
  )
