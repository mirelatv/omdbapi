$ ->
  $('form').submit (e) ->
    e.preventDefault()
    input = $("form input[type='text']")
    name = input.val()
    input.val('')

    # Step 1
    $.ajax
      url: "http://www.omdbapi.com/?s=#{name}"
      dataType: "json"
    .done (data) ->
      $('.result').html('')
      for movie in data.Search
        console.log movie.Title
        $('.result').append("<div><a data-imdb='#{movie.imdbID}' href='http://www.google.com/'>#{movie.Title}</a></div>")

      $('.result > div > a').click (event) ->
        event.preventDefault()
        console.log $(@).data('imdb')
        # Step 2
        $.ajax
          url: "http://www.omdbapi.com/?i=#{$(@).data('imdb')}"
          dataType: "json"
        .done (d) ->
          $("h1 > span").html(d.Title)
          $("h2 > span").html(d.Actors)
          $(".poster").html("<img src=\"#{d.Poster}\" />")


