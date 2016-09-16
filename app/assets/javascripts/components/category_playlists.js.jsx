class CategoryPlaylists extends React.Component {
  constructor(props) {
    super();
    this.state = {
      categoryPlaylists: props.categoryPlaylists
    }
  }

  render() {
    var categoryPlaylists = this.state.categoryPlaylists.map( (playlist) => {
      return <CategoryPlaylist key={playlist.table.id} playlist={playlist} />
    });
    return(
      <div>{categoryPlaylists}</div>
    );
  }
}
