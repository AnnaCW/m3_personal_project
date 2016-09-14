class ItemArtist extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return(
      <h3>by{this.props.artist.name}</h3>
      // add link to artist show
    )
  }
}
