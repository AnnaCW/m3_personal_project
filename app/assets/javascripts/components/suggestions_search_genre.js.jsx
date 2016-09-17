class SuggestionsSearchGenre extends React.Component {
  constructor(props) {
    super();
    this.state = {
      genres: props.genres
    }
  }

  render() {
    var options = this.state.genres.map ( (genre) => {
      return <OptionForSelect key={genre} data={genre} />
    });

    return(
      <div className='suggest genre row'>
        <h3>Top Tracks By Genre</h3>
        <form className='form-inline' action='/suggestions' acceptCharset='UTF-8' method='get'>
          <div className='form-group'>
            <select name='genre' id='genre' className='large-search'>
              <option value="">Select Genre</option>
              {options}
            </select>
            <input type='submit' name='commit' value='GET!' className='btn btn-success' data-disable-with='GET!' />
          </div>
        </form>
      </div>
    );
  }
}
