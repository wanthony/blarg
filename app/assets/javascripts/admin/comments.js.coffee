# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).bind('ready', ->
  $('[id^="comments_"]').hide().data('toggle', false)

  $('[id^="article_"]').click(->
    try #ignore errors from other pages trying to use this code
      id = parseInt($(this).attr('id').match(/\d+/)[0])
      el = $("#comments_#{id}")

      el.data('toggle', !el.data('toggle'))

      # Slide up / down the list of article comments based on the stored
      # 'toggle' data.  'toggle' defaults to false, which will initially
      # allow the user to display the list of comments.
      if el.data('toggle') is true
        el.slideUp()
      else
        el.slideDown()
  )
)
