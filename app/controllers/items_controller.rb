class ItemsController < ApplicationController

  def show
    @user = current_user if current_user
    @item = Item.find(@user, params[:type], params[:id], params[:format])  
  end
end
