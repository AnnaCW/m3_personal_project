class Artist extends React.Component {
  constructor(props) {
    super();
    this.state = {
       artist: props.artistData,
       tracks: props.trackData
     };
  }

  render() {
    var artist = this.state.artist.table
    var tracks = this.state.tracks.map( (track) => {
      console.log(track.table.id)
      return <Track key={track.table.id} track={track} />
    })
    return (
      <div className='container'>

        <h2>{artist.name}</h2>
        <h3>Top Tracks</h3>

        <table className='table'>
          <thead>
            <tr>
              <td>Track</td>
              <td>Album</td>
              <td>Play It</td>
            </tr>
          </thead>

          <tbody>
            {tracks}
          </tbody>

        </table>
      </div>
    )
  }
}
