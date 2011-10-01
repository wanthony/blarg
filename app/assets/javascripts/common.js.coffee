$(document).bind('ready', ->
  $('.dropdown').dropdown()

  $('.alert-message').alert()

  $('.alert-message a.close').click(->
    $(this).parent().alert('close')
  )
)

