$(document).ready(function(){
  console.log("Hello");

  $("#track-suggestions").on('click', function(){
    var userId = $("#user-id").data("target")
    var itemId = $("#item-id").data("target")

    $.ajax({
      url: "/api/v1/suggestions.json",
      method: "GET",
      dataType: "JSON",
      data: {user_id: userId, seed_tracks: itemId },

      success: function(suggestions){
        console.table(suggestions);
        $(".suggestions").show();
        $(suggestions).each(function(index, suggestion){
          $("#suggested-track-list").append(
            "<tr><td>" + suggestion["name"] + "</td>" +
            //  "<tr><td><a href='items/tracks/"+ suggestion["id"] + "'>" + suggestion["name"] + "</a></td>" +
            "<td>" + suggestion["artists"][0]["name"] + "</td>" +
            "<td>" + suggestion["album"]["name"] + "</td></tr>"
          )
        })
      }

    })

  });
});
