class CategoriesController < ApplicationController
  def index
    user = current_user if current_user
    @categories = Category.all(user)
  end
end
