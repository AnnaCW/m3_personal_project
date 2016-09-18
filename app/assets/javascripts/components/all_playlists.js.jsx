class AllPlaylists extends React.Component {

  render () {
    var playlists = this.props.playlists.map( (playlist) => {
      return <Playlist key= {playlist.id} playlist={playlist} />
    });
    return (
      <div className='container'>
        <h1>My Playlists</h1>
        <div className='playlists-index-list'>
          {playlists}
        </div>
      </div>
    );
  }
}
