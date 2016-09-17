class SuggestionGenre extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    var artists = this.props.suggestion.table.artists.map ((artist) => {
      return <TrackArtist key={artist.id} artist={artist} />
    });
    return(
      <tr>
        <td><a href={"/items/" + this.props.suggestion.table.type + "s/" + this.props.suggestion.table.id + ""} >{this.props.suggestion.table.name}</a></td>
        <td>{artists}</td>
        <td>{this.props.suggestion.table.album.name}</td>
        <td><iframe src={"https://embed.spotify.com/?uri=" + this.props.suggestion.table.uri + "&theme=white"} width="250" height="80" frameBorder="0" allowTransparency="true"></iframe></td>
      </tr>
    );
  }
}
