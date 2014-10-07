name = "True Grit"
year = 1969

$ ->
  $.ajax
    url: "http://www.omdbapi.com/?t=#{name}&y=#{year}"
    dataType: "json"
  .done (data) ->
    console.log data
    console.log data.Title
    $("h1 > span").html(data.Title)
    $("h2 > span").html(data.Actors)
    $(".poster").html("<img src=\"#{data.Poster}\" />")


