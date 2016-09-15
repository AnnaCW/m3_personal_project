class ItemArtist extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return(
      <h3>by <a href={"/artists/" + this.props.artist.id + ""}>{this.props.artist.name}</a></h3>
    )
  }
}
