# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

  $('.ind-show-paragraph-truncated').each (index) ->
    fullText = this.textContent
    if fullText.length > 300
      words = fullText.substring(0,300).split(' ')
      shortText = words.slice(0, words.length-1).join(' ') + "..."
      $(this).data('full-text', fullText)
      $(this).data('short-text', shortText)
      $(this).text(shortText)
      $(this).append("<a class='read-more-link'> (see more)</a>")

  $("body").on 'click', '.read-more-link', ->
    fullText = $(this.parentElement).data('full-text')
    $(this.parentElement).html(fullText + "<a class='read-less-link'> (see less)</a>")

  $("body").on 'click', '.read-less-link', ->
    console.log('here')
    shortText = $(this.parentElement).data('short-text')
    $(this.parentElement).html(shortText + "<a class='read-more-link'> (see more)</a>")

  $('a[class=current-show-artwork]')
    .attr('rel', 'gallery')
    .fancybox({
      padding: 0
      beforeLoad: ->
        el = $(this.element).find('.artwork-title');
        if (el.length)
          this.title = el.html();
      helpers:
        title:
          type: 'outside'
    });

$(document).ready(ready)
$(document).on('page:load', ready)

