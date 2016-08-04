$(document).ready(function(){
  console.log("Hello");

  $("#add-to-playlist").on('click', function(){
    var userId = $("#user-id").data("target")
    $("#add-to-playlist").toggle("style");

    $.ajax({
      url: "/api/v1/playlists.json",
      method: "GET",
      dataType: "JSON",
      data: {user_id: userId },

    success: function(playlists){
      console.table(playlists);
      $("#playlists-listing").append(
          "<label>Select A Playlist </label>" +
          "<select class='form-control-inline' id='playlist-select'></select>"
        )
      $(playlists).each(function(index, playlist){
        $("#playlist-select").append(
          "<option data-target='" + playlist["table"]["id"] + "'>" + playlist["table"]["name"] + "</option>"
        )
        $("#add-button").show();
        $("#cancel-button").show();
      })
     }
    })
  });

  $("#add-button").on('click', function(){
    console.log("add button clicked");
    var userId = $("#user-id").data("target")
    var playlistId = $("select :selected[data-target]").data("target")
    var trackUri = $("#item-uri").data("target")

    $.ajax({
      url: "/api/v1/playlists/" + playlistId + ".json",
      method: "PATCH",
      dataType: "JSON",
      data: {user_id: userId, playlist_id: playlistId, track_uri: trackUri },

      success: function(updatePlaylist){
        console.table(updatePlaylist);
        $("#add-to-playlist").hide();
        $("#playlists-listing").hide();
        $("#add-button").hide();
        $("#cancel-button").hide();
        $("#added-message").slideDown(function() {
          setTimeout(function() {
          $("#added-message").slideUp();
        }, 3000);
});
      }
    })
  });

  $("#cancel-button").on('click', function(){
    $("#add-to-playlist").hide();
    $("#playlists-listing").hide();
    $("#add-button").hide();
    $("#cancel-button").hide();
   });

   $("#create-playlist-button").on('click', function(){
     var userId = $("#user-id").data("target")
     var playlistName = $("input#new-playlist-name").val()

     $.ajax({
       url: "/api/v1/playlists.json",
       method: "POST",
       dataType: "JSON",
       data: {user_id: userId, playlist_name: playlistName },

       success: function(newPlaylist){
        console.table(newPlaylist);
        $("input#new-playlist-name").val("");
        $(".playlists-index-list").append(
          "<div class='col-md-4' id=" + newPlaylist["name"] + ">" +
            "<h4>" + newPlaylist["name"] + "<h4>" +
            "<iframe src='https://embed.spotify.com/?uri=" + newPlaylist["uri"] + "&theme=white' width='300' height='380' frameborder='0' allowtransparency='true'></iframe>" +
          "</div>"
        )
       }
     })
   });
});
