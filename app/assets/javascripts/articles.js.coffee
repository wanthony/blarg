# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).bind('ready', ->
  $add_comment = $('#add_comment')

  $add_comment.click(->
    $('#add_comment_form').slideDown(1000)
  )

  $('#add_comment_form').hide()

  $('#submit_comment').click(->
    article_id = window.location.pathname.match(/articles\/(\d+)/)[1]

    $.post("/articles/#{article_id}/comments/create", {
      comment:
        body: $('#comment_body').text()
        article_id: article_id
    }, (data) ->
      $.getJSON("#{window.location.pathname}/comments.json", (data) ->
        $('#article_comments').html('')

        $.each(data, (key, val) ->
          $('#article_comments').append("""
            <div class="well">
              #{val.body}
            </div>
          """)
        )
      )
    )
  )
)

