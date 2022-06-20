class PostsController < ApplicationController
  def index
    @user_posts =Post.where(user_id: params[:user_id]).order(created_at: :DESC)
    @user_info = User.find_by(id: params[:user_id])
    @user_posts
  end

  def show
    @post_info = Post.find_by(id:params[:id])
    puts @post_info
    @post_info
  end
end
