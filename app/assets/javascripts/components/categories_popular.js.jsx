class CategoriesPopular extends React.Component {
  constructor(props) {
    super();
    this.state = {
      user: props.user,
      presenter: props.presenter
    }
  }

  render() {
    console.log(this.state.presenter.popular)
    var popularCategories = this.state.presenter.popular.map( (category) => {
      return <Category key={category.key} category={category} />
    });

    return(
      <div className='col-md-6 popular-categories'>
        <h2>Browse Popular Categories</h2>
        <table id='browse-categories'>{popularCategories}</table>
      </div>
    )
  }
}
