class Playlists extends React.Component {
  constructor(props) {
    super();
    this.state = {
      playlists: props.playlists
    };
  }

  handleSubmit(playlist) {
    var newState = this.state.playlists.concat(playlist);
    this.setState({playlist: newState})
  }

  render () {
    return (
      <div>
        <NewPlaylist handleSubmit={this.handleSubmit} />
        <AllPlaylists playlists={this.state.playlists} />
      </div>

    )
  }
}
