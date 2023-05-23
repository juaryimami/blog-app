class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @list_of_posts = @user.recent_posts
  end
end
