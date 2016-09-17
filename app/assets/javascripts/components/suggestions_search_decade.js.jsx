class SuggestionsSearchDecade extends React.Component {
  constructor(props) {
    super();
    this.state = {
      decades: props.decades
    }
  }

  render() {
    var options = this.state.decades.map ( (decade) => {
      return <OptionForSelect key={decade} data={decade} />
    });

    return(
      <div className='suggest decade row'>
        <h3>Search For Playlists by Decade</h3>
        <form className='form-inline' action='/suggestions' acceptCharset='UTF-8' method='get'>
          <div className='form-group'>
            <select name='decade' id='decade' className='large-search'>
              <option value="">Select Decade</option>
              {options}
            </select>
            <input type='submit' name='commit' value='GET!' className='btn btn-success' data-disable-with='GET!' />
          </div>
        </form>
      </div>
    );
  }
}
