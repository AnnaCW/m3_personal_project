class Category extends React.Component {
  constructor(props) {
    super();
  }

  render() {
    return (
      <tr>
        <td><a href={"/categories/" + this.props.category.table.id + ""}>  {this.props.category.table.name}</a></td>
      </tr>
    )
  }
}
