class AllCategories extends React.Component {
  constructor(props) {
    super();
    this.state = {
      allCategories: props.allCategories
    }
  }

  render() {
    var allCategories = this.state.allCategories.map( (category) => {
      return <Category key={category.table.id} category={category} />
    });

    return(
      <div className='col-md-6 all-categories'>
        <h2>Browse All Categories</h2>
        <table id='browse-categories'>
          <tbody>{allCategories}</tbody>
        </table>
      </div>
    )
  }
}
