class Item extends React.Component {
  constructor(props) {
    super();
    this.state = {
      item: props.item
    }
  }

  render() {
    var item = this.state.item.table;
    
    if (item.artists) {
      var artists = item.artists.map ((artist) => {
        return <ItemArtist key={artist.id} artist={artist} />
      });
    }

    if (item.type === "track") {
      return(
        <div className='col-md-6'>
          <div className='row'>
            <h2>{item.name}</h2>
              <div>{artists}</div>
              <iframe src={"https://embed.spotify.com/?uri=" + item.uri + "&theme=white"} width="300" height="380" frameBorder="0" allowTransparency="true"></iframe>
          </div>
        </div>
        )
      }

      else {
        return(
          <div className='col-md-6'>
            <div className='row'>
              <h2>{item.name}</h2>
              <iframe src={"https://embed.spotify.com/?uri=" + item.uri + "&theme=white"} width="300" height="380" frameBorder="0" allowTransparency="true"></iframe>
            </div>
          </div>
        )
      }
   }
}
