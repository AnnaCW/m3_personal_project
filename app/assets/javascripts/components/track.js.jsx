class Track extends React.Component {
  constructor(props) {
    super(props);
  }

  render () {
    console.log(this.props.track.table.uri)
    var uri = this.props.track.table.uri
    return (
      <tr>
        <td>{this.props.track.table.name}</td>
        <td>{this.props.track.table.album.name}</td>
        <td><iframe src={"https://embed.spotify.com/?uri=" + this.props.track.table.uri + "&theme=white"} width="250" height="80" frameBorder="0" allowTransparency="true"></iframe></td>
      </tr>
    )
  }
}
