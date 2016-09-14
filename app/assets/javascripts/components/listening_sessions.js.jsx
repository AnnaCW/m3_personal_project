class ListeningSessions extends React.Component {
  constructor(props) {
    super();
    this.state = {
      listeningSessions: props.listeningSessions
    };
  }
  
  render() {
    var listeningSessions = this.state.listeningSessions.map( (listeningSession) => {
      return <ListeningSession key={listeningSession.id} listeningSession={listeningSession} />
    });

    return(
      <table className="table listening-sessions">
        <thead>
          <tr>
            <td>Name</td>
            <td>Date Updated</td>
            <td>Date Created</td>
          </tr>
        </thead>
        <tbody>{listeningSessions}</tbody>
      </table>
    );
  }

}
