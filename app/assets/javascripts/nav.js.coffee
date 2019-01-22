ready = ->
  console.log("hellooooo")
  $("body").on 'click', '#js-navbar-toggle', ->
    console.log('clicky')
    $('#js-menu').toggleClass('active')

$(document).ready(ready)
$(document).on('page:load', ready)
