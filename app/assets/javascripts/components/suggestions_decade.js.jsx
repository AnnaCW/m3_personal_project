class SuggestionsDecade extends React.Component {
  constructor(props) {
    super();
    this.state = {
      decade: props.decade,
      decadeSuggestions: props.decadeSuggestions
    }
  }

  render() {
    var decadeSuggestions = this.state.decadeSuggestions.map ( (suggestion) => {
      return <SuggestionDecade key={suggestion.table.id} suggestion={suggestion} />
    });
    return(
      <div>
        <div className='decade-suggestions-header'>
          <h3>{this.state.decade} Playlists</h3>
        </div>
        <table className='table'>
          <thead>
            <tr>
              <td>Playlist</td>
              <td>Number of Tracks</td>
            </tr>
          </thead>
          <tbody>{decadeSuggestions}</tbody>
        </table>
      </div>
    );
  }
}
