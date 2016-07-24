class CategoriesPresenter

  def initialize(user)
    @_user = user
  end

  def categories
    @categories ||= Category.all(user)
  end

  def popular
    @popular ||= Category.popular(user)
  end

  def category_playlists(category_id)
    @category_playlists ||= Category.playlists(user, category_id)
  end

  def find(category_id)
    @find = Category.find(user, category_id)
  end

  private

  def user
    @_user
  end

end
