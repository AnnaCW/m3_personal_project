class NewPlaylist extends React.Component {
  constructor(props) {
    super(props);
 }


  handleClick() {
    var userId = $("#user-id").data("target");
    var playlistName = $("input#new-playlist-name").val();

    $.ajax({
      url: "/api/v1/playlists.json",
      method: "POST",
      data: {user_id: userId, playlist_name: playlistName },
      success: (playlist) => {
        this.props.handleSubmit(playlist);
      }
    });
  }

    render() {
      return (
        <div className='container'>
          <div className='row pull-right'>
            <form className='form-inline'>
              <label>New Playlist</label>
              <input ref='name' className='form-control' type='text' id='new-playlist-name' placeholder='Playlist Name'/>
              <button onClick={this.handleClick.bind(this)} className='btn btn-success btn-xs' id='create-playlist-button' type='button' name='button'>Create</button>
            </form>
          </div>

        </div>
      );
    };
  };
