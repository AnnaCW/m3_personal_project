class CategoriesController < ApplicationController
  def index
    user = current_user if current_user
    @presenter ||= CategoriesPresenter.new(user)
  end

  def show
    @user = current_user if current_user
    @presenter ||= CategoriesPresenter.new(@user)
  end

end
