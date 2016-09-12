class ListeningSession extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return(
      <tr>
        <td>{this.props.listeningSession.item_name}</td>
        <td>{this.props.listeningSession.user_id}</td>
        <td>{this.props.listeningSession.updated_at}</td>
        <td>{this.props.listeningSession.created_at}</td>
        <td>{this.props.listeningSession.item_type}</td>
        <td>{this.props.listeningSession.item_id}</td>
        <td>{this.props.listeningSession.agitation_before}</td>
        <td>{this.props.listeningSession.agitation_after}</td>
        <td>{this.props.listeningSession.awareness_before}</td>
        <td>{this.props.listeningSession.awareness_after}</td>
        <td>{this.props.listeningSession.communicativeness_before}</td>
        <td>{this.props.listeningSession.communicativeness_after}</td>
        <td>{this.props.listeningSession.duration}</td>
      </tr>
    )
  }
}
