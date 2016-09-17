class TrackArtist extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return(
      <p><a href={"/artists/" + this.props.artist.id + ""}>{this.props.artist.name}</a></p>
    )
  }
}
