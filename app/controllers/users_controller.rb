class UsersController < ApplicationController
  def index
    @users = all_users
  end

  def show
    my_id = params[:id]
    @user_info = User.find_by(id: my_id.to_i)
    @recent_posts = recent_posts(my_id.to_i)
    #@current_user = current_user
    #@user_info = User.find(params[:id])
  end
end
