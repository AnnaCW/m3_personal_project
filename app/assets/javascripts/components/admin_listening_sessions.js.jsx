class AdminListeningSessions extends React.Component {
  constructor(props) {
    super();
    this.state = {
      listeningSessions: props.listeningSessions
    };
  }

  render()  {
    var listeningSessions = this.state.listeningSessions.map( (listeningSession) => {
      return <ListeningSession key={listeningSession.id} listeningSession={listeningSession} />
    })
    return (
      <table className="table listening-sessions">
        <thead>
          <tr>
            <td>Session Name</td>
            <td>User ID</td>
            <td>Date Updated</td>
            <td>Date Created</td>
            <td>Item Type</td>
            <td>Item ID</td>
            <td>Agitation Before</td>
            <td>Agitation After</td>
            <td>Awareness Before</td>
            <td>Awareness After</td>
            <td>Communicativeness Before</td>
            <td>Communicativeness After</td>
            <td>Duration</td>
          </tr>
        </thead>
        <tbody>{listeningSessions}</tbody>
      </table>
    )
  }
}
