class Category extends React.Component {
  constructor(props) {
    super();
  }

  render() {
    return (
      <tr>
        <td>{this.props.category.name}</td>
      </tr>
    )
  }
}
