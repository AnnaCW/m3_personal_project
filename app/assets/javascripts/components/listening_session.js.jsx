class ListeningSession extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    // console.log(this.props.listeningSessions);
    return(
      <div className='individual-session' id={this.props.listeningSession.id} style='display:none;'>
        <tr>
          <td>{this.props.listeningSession.item_name}</td>
          <td>{this.props.listeningSession.updated_at}</td>
          <td>{this.props.listeningSession.created_at}</td>
          <td><button className='btn btn-primary show-session' id={this.props.listeningSession.id} data-target={this.props.listeningSession.id}>Show</button></td>
        </tr>

        <tr className='session-box' id={this.props.listeningSession.id} style='display:none;'>
          <form>
          <td>
              <div className='form-group'>
                <label for='notes'>Notes</label>
                <textArea className='form-control notesTextarea' id={listeningSession.id} rows='5'>{this.props.listeningSession.notes}</textArea>
              </div>
          </td>
          <td>
            <label>Agitation Level Before</label>
            <select className="form-control-inline agitation-before" id={this.props.listeningSession.id} selected={this.props.listeningSession.agitation_before}>
              <option>{this.props.agitation_before}</option>
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
             <option>5</option>
             </select>
          </td>

          <td>

            <label>Agitation Level After</label>
            <select className="form-control-inline agitation-after" id={this.props.listeningSession.id} selected={this.props.listeningSession.agitation_after}>
              <option>{this.props.listeningSession.agitation_after}</option>
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
            </select>

          </td>
          <td>

            <label>Awareness of Surroundings Before</label>
            <select className="form-control-inline awareness-before" id={this.props.listeningSessions.id} selected={this.props.listeningSession.awareness_before}>
              <option>{this.props.listeningSession.awareness_before}</option>
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
            </select>
          </td>
          <td>

            <label>Awareness of Surroundings After</label>
            <select className="form-control-inline awareness-after" id={this.props.listeningSession.id} selected={this.props.listeningSession.awareness_after}>
              <option>{this.props.listeningSession.awareness_after}</option>
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
            </select>
          </td>
          <td>

            <label>Communicativeness Before</label>
            <select className="form-control-inline communicativeness-before" id={this.props.listeningSession.id} selected={this.props.listeningSession.communicativeness_before}>
              <option>{this.props.listeningSession.communicativeness_before}</option>
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
            </select>
          </td>
          <td>

            <label>Communicativeness After</label>
            <select className="form-control-inline communicativeness-after" id={this.props.listeningSession.id} selected={this.props.communicativeness_after}>
              <option>{this.props.listeningSession.communicativeness_after}</option>
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
            </select>
          </td>
          <td>
            <label>Duration of Session (min)</label>
            <select className="form-control-inline duration" id={this.props.listeningSession.id} selected={this.props.listeningSession.duration}>
              <option>{this.props.listeningSession.duration}</option>
              <option>5</option>
              <option>15</option>
              <option>30</option>
              <option>45</option>
              <option>60</option>
              <option>90</option>
              <option>120</option>
            </select>
        </td>
        <td><button className='btn btn-success update-button' data-target={this.props.listeningSession.id}>Update</button></td>
        </form>

        </tr>
      </div>
    )
  }
}
