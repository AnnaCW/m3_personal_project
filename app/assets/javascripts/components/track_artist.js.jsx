class TrackArtist extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return(
      <p>{this.props.artist.name}</p>
    )
  }
}
