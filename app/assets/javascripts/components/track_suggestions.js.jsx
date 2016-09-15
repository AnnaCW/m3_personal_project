class TrackSuggestions extends React.Component {
  constructor(props) {
    super();
    this.state = {
      item: props.item,
      user: props.user
    }
  }

  render () {
  
    return (
      <div className='row'>
        <button className= 'btn btn-primary' id='track-suggestions'>More Like This</button>
      <div id="item-id" style={{display: 'none'}} data-target={this.state.item.table.id}></div>
      <div id="user-id" style={{display: 'none'}} data-target={this.state.user.id}></div>
      <div id="item-uri" style={{display: 'none'}} data-target={this.state.item.table.uri}></div>
    </div>
    )
  }
}
