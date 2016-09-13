class Playlist extends React.Component {
  constructor(props) {
    super(props);
  };

  render() {
    return(
      <div className='col-md-4' id={this.props.playlist.table.name}>
        <h4>{this.props.playlist.table.name}</h4>
        <iframe src={"https://embed.spotify.com/?uri=" + this.props.playlist.table.uri + "&theme=white"} width="300" height="380" frameBorder="0" allowTransparency="true"></iframe>
      </div>
    );
  };
};
