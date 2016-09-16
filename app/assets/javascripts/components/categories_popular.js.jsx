class CategoriesPopular extends React.Component {
  constructor(props) {
    super();
    this.state = {
      popularCategories: props.popularCategories
    }
  }

  render() {
    var popularCategories = this.state.popularCategories.map( (category) => {
      return <Category key={category.table.id} category={category} />
    });

    return(
      <div className='col-md-6 popular-categories'>
        <h2>Browse Popular Categories</h2>
        <table id='browse-categories'>
          <tbody>{popularCategories}</tbody>
        </table>
      </div>
    )
  }
}
