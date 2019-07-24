ready = ->
  $("#current-show-images").slick({
    dots: true,
    infinite: true,
    speed: 500,
    fade: true,
    cssEase: 'linear'
  })


$(document).ready(ready)
$(document).on('page:load', ready)
