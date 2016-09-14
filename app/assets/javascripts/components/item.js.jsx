class Item extends React.Component {
  constructor(props) {
    super();
    this.state = {
      item: props.item
    }
  }

  render() {
    var item = this.state.item.table;
    var artists = item.artists.map ((artist) => {
      return <ItemArtist key={artist.id} artist={artist} />
    });

    if (item.type === "track") {
      return(
        <div className='col-md-6'>
          <div className='row'>
            <h2>{item.name}</h2>
              <div>{artists}</div>
          </div>
        </div>
        )
      }

      else {
        return(
          <div className='col-md-6'>
            <div className='row'>
              <h2>{item.name}</h2>
            </div>
          </div>
        )
      }
   }
}
