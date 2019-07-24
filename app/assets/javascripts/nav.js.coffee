ready = ->
  $("body").on 'click', '#js-navbar-toggle', ->
    $('#js-menu').toggleClass('active')

$(document).ready(ready)
$(document).on('page:load', ready)
