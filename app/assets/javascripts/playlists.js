$(document).ready(function(){
  console.log("Hello");

   $("#create-playlist-button").on('click', function(){
     var userId = $("#user-id").data("target");
     var playlistName = $("input#new-playlist-name").val();

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
        );
       }
     });
   });
});
