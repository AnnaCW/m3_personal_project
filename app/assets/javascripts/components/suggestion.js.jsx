class Suggestion extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    var artists = this.props.suggestion.artists.map ((artist) => {
      return <TrackArtist key={artist.id} artist={artist} />
    });
    return(
      <tr>
        <td><a href={"" + this.props.suggestion.id +""}>{this.props.suggestion.name}</a> </td>
        <td>{artists}</td>
        <td>{this.props.suggestion.album.name}</td>
      </tr>
    )
  }
}
