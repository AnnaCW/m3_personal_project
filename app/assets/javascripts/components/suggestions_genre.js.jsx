class SuggestionsGenre extends React.Component {
  constructor(props) {
    super();
    this.state = {
      genre: props.genre,
      genreSuggestions: props.genreSuggestions
    }
  }

  render() {
    var genreSuggestions = this.state.genreSuggestions.map ( (suggestion) => {
      return <GenreSuggestion key={suggestion.table.id} suggestion={suggestion} />
    });
    return(
      <div>
        <div className='genre-suggestions-header'>
          <h3>Top {this.state.genre} Selections</h3>
        </div>
        <table className='table'>
          <thead>
            <tr>
              <td>Track</td>
              <td>Artist</td>
              <td>Album</td>
              <td>Play It</td>
            </tr>
          </thead>
          <tbody>{genreSuggestions}</tbody>
        </table>
      </div>
    );
  }
}
