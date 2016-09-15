class AddToPlaylist extends React.Component {
  constructor(props) {
    super();
    this.state = {
      playlists: []
    };
  }

  getPlaylists() {
    var userId = $("#user-id").data("target")
    $("#add-to-playlist").toggle("style");

    $.ajax({
      url: "/api/v1/playlists.json",
      method: "GET",
      dataType: "JSON",
      data: {user_id: userId },
      success: (response) => {
        this.setState({ playlists: response });
        $("#playlists-listing").show();
        $("#add-button").show();
        $("#cancel-button").show();
      }
    });
  }

  addtoPlaylist() {
    var userId = $("#user-id").data("target");
    var playlistId = $("select :selected[data-target]").data("target");
    var trackUri = $("#item-uri").data("target");

    $.ajax({
      url: "/api/v1/playlists/" + playlistId + ".json",
      method: "PATCH",
      data: {user_id: userId, playlist_id: playlistId, track_uri: trackUri },
      success: () => {
        $("#add-to-playlist").hide();
        $("#playlists-listing").hide();
        $("#add-button").hide();
        $("#cancel-button").hide();
        $("#added-message").slideDown( () => {
          setTimeout( () => {
          $("#added-message").slideUp();
        }, 3000);
      });
     }
    });
  }

  render() {
    var playlists = this.state.playlists.map( (playlist) => {
      return <PlaylistForAdd key={playlist.id} playlist={playlist} />
    });
    return(
      <div>
        <div className="row">
          <button onClick={this.getPlaylists.bind(this)} className="btn btn-success" id="add-to-playlist" type="button" name="button">Add to Playlist</button>
        </div>

        <div id="playlists-listing" style={{display: 'none'}}>
          <label>Select A Playlist</label>
          <select className='form-control-inline' id='playlist-select'>{playlists}</select>
        </div>

        <button onClick={this.addtoPlaylist.bind(this)} className="btn btn-success btn-xs" id="add-button" style={{display: 'none'}} type="button" name="button">Add</button>
        <button className="btn btn-danger btn-xs" id="cancel-button" style={{display: 'none'}} type="button" name="button">Cancel</button>
        <div id="added-message" style={{display: 'none'}}>Added!</div>
      </div>
    )
  }
}
