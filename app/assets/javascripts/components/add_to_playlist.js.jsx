class AddToPlaylist extends React.Component {
  constructor(props) {
    super();
  }

  render() {
    return(
      <div>
        <div className="row">
          <button className="btn btn-success" id="add-to-playlist" type="button" name="button">Add to Playlist</button>
        </div>

        <div id="playlists-listing"></div>
        <button className="btn btn-success btn-xs" id="add-button" style={{display: 'none'}} type="button" name="button">Add</button>
        <button className="btn btn-danger btn-xs" id="cancel-button" style={{display: 'none'}} type="button" name="button">Cancel</button>
        <div id="added-message" style={{display: 'none'}}>Added!</div>
      </div>
    )
  }
}
