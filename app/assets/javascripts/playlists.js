$(document).ready(function(){
  console.log("Hello");

  $("#add-to-existing-playlist").on('click', function(){
    var userId = $("#user-id").data("target")

    $.ajax({
      url: "/api/v1/playlists.json",
      method: "GET",
      dataType: "JSON",
      data: {user_id: userId },

    success: function(playlists){
      console.table(playlists);
      $("#playlists-listing").append(
          "<label>Select A Playlist</label>" +
          "<select class='form-control-inline' id='playlist-select'></select>"
          // "<button class='btn btn-success btn-xs' id='add-button'>Add</button>"
        )
      $(playlists).each(function(index, playlist){
        $("#playlist-select").append(
          "<option data-target='" + playlist["table"]["id"] + "'>" + playlist["table"]["name"] + "</option>"
        )
        $("#add-button").show();
      })
    }

    })

  });

  // $("select :selected[id]");

  $("#add-button").on('click', function(){
    console.log("add button clicked");
    var userId = $("#user-id").data("target")
    var playlistId = $("select :selected[data-target]").data("target")
    var trackUri = $("#item-id").data("target")

    $.ajax({
      url: "/api/v1/playlists/" + playlistId + ".json",
      method: "PATCH",
      dataType: "JSON",
      data: {user_id: userId, playlist_id: playlistId, track_uri: trackUri },

      success: function(updatePlaylist){
        console.table(updatePlaylist);
        $("#add-to-existing-playlist").hide();
        $("#playlists-listing").hide();
        $("#add-button").hide();

      }

    })

  });

});
