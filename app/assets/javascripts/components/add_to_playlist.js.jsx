class AddToPlaylist extends React.Component {
  constructor(props) {
    super();
    this.state = {
      playlists: []
    };
  }

  handleClick() {
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

  render() {
    var playlists = this.state.playlists.map( (playlist) => {
      return <PlaylistForAdd key={playlist.id} playlist={playlist} />
    });
    return(
      <div>
        <div className="row">
          <button onClick={this.handleClick.bind(this)} className="btn btn-success" id="add-to-playlist" type="button" name="button">Add to Playlist</button>
        </div>

        <div id="playlists-listing" style={{display: 'none'}}>
          <label>Select A Playlist</label>
          <select className='form-control-inline' id='playlist-select'>{playlists}</select>
        </div>

        <button className="btn btn-success btn-xs" id="add-button" style={{display: 'none'}} type="button" name="button">Add</button>
        <button className="btn btn-danger btn-xs" id="cancel-button" style={{display: 'none'}} type="button" name="button">Cancel</button>
        <div id="added-message" style={{display: 'none'}}>Added!</div>
      </div>
    )
  }
}
