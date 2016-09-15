class TrackSuggestions extends React.Component {
  constructor(props) {
    super();
    this.state = {
      item: props.item,
      user: props.user,
      suggestions: []
    }
  }

  handleClick() {
    var userId = $("#user-id").data("target")
    var itemId = $("#item-id").data("target")
    $(".suggestions").toggle("style");

    $.ajax({
      url: "/api/v1/suggestions.json",
      method: "GET",
      data: {user_id: userId, seed_tracks: itemId },
      success: (response) => {this.setState({ suggestions: response })}
    });
  }


  render () {
    var suggestions = this.state.suggestions.map ( (suggestion) => {
      return <Suggestion key={suggestion.id} suggestion={suggestion} />
    });
    return (
      <div>
        <div className='row'>
          <button onClick={this.handleClick.bind(this)} className= 'btn btn-primary' id='track-suggestions'>More Like This</button>
          <div id="item-id" style={{display: 'none'}} data-target={this.state.item.table.id}></div>
          <div id="user-id" style={{display: 'none'}} data-target={this.state.user.id}></div>
          <div id="item-uri" style={{display: 'none'}} data-target={this.state.item.table.uri}></div>
        </div>

      <table className="table suggestions" style={{display: 'none'}}>
        <thead>
          <tr>
            <td>Track</td>
            <td>Artist</td>
            <td>Album</td>
          </tr>
        </thead>
        <tbody id="suggested-track-list">
          {suggestions}
        </tbody>
      </table>
    </div>
    )
  }
}
