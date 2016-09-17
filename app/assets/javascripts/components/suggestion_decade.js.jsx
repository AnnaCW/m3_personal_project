class SuggestionDecade extends React.Component {
  constructor(props) {
    super(props);

  }

  render() {
    return(
      <tr>
        <td> <a href={"/items/" + this.props.suggestion.table.type + "s/"+ this.props.suggestion.table.id + "."+ this.props.suggestion.table.owner.id + ""}>{this.props.suggestion.table.name}</a></td>
        <td>{this.props.suggestion.table.tracks.total}</td>
      </tr>
    );
  }
}
