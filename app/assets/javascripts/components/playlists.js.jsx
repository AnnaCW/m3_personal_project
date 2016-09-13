class Playlists extends React.Component {
  constructor(props) {
    super();
    this.state = {
      playlists: props.playlists
    };
  }

  handleSubmit(playlist) {
    $("input#new-playlist-name").val("");
    $(".playlists-index-list").append(
      "<div class='col-md-4' id=" + playlist.name + ">" +
        "<h4>" + playlist.name + "<h4>" +
        "<iframe src='https://embed.spotify.com/?uri=" + playlist.uri + "&theme=white' width='300' height='380' frameborder='0' allowtransparency='true'></iframe>" +
      "</div>"
    )
  }

  render () {
    return (
      <div>
        <NewPlaylist handleSubmit={this.handleSubmit.bind(this)}/>
        <AllPlaylists playlists={this.state.playlists} />
      </div>

    )
  }
}
