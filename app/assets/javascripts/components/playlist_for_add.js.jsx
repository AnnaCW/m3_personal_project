class PlaylistForAdd extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    return(
      <option data-target={this.props.playlist.table.id}>{this.props.playlist.table.name}</option>
    )
  }
}
