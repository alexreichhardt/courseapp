ready = ->
  $('#toggle-btn').click ->
    $('.container').fadeOut()
    return

$(document).ready ready
$(document).on 'turbolinks:load', ready
