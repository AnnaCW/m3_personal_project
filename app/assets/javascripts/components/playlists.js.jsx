class Playlists extends React.Component {
  constructor(props) {
    super();
    this.state = {
      playlists: props.playlists
    };
  };

  render () {
    var playlists = this.state.playlists.map( (playlist) => {
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
  };
};
