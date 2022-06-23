class PostsController < ApplicationController
  def index
    @user_posts = Post.where(user_id: params[:user_id]).order(created_at: :DESC)
    @user_info = User.find_by(id: params[:user_id])
  end

  def show
    @post_info = Post.find_by(id: params[:id])
  end

  def new
    respond_to do |format|
      format.html { render :new, locals: { post: Post.new } }
    end
  end

  def create
    user = current_user
    post = Post.new(post_params)
    post.user = user

    if post.save
      flash[:notice] = 'Post saved successfully'
      post.posts_counter
      redirect_to user_posts_url
    else
      flash[:alert] = 'Error: Post could not be saved'
      redirect_to new_user_post_url
    end
  end

  private

  def post_params
    params.require(:post).permit(:Title, :Text)
  end
end
