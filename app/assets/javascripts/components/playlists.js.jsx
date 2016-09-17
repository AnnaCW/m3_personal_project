class Playlists extends React.Component {
  constructor(props) {
    super();
    var formattedPlaylists = props.playlists.map( (playlist) => {
      return playlist.table
    });
    this.state = {
      playlists: formattedPlaylists
    };
  }

  handleSubmit(playlist) {
    var newState = this.state.playlists.concat(playlist);
    this.setState( {playlists: newState} );
     $("input#new-playlist-name").val("");
  }

  render () {
    return (
      <div>
        <NewPlaylist handleSubmit={this.handleSubmit.bind(this)}/>
        <AllPlaylists playlists={this.state.playlists} />
      </div>
    );
  }
}
