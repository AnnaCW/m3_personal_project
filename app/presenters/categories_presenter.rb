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

  private

  def user
    @_user
  end

end
