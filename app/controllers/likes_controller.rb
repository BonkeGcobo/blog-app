class LikesController < ApplicationController
  def new
    respond_to do |format|
      format.html { render :new, locals: { like: Like.new } }
    end
  end

  def create
    user = current_user
    post_id = params[:post_id]
    post = Post.find_by(id: post_id.to_i)
    params.permit!
    like = Like.new
    like.user = user
    like.post = post

    if like.save
      like.update_likes
      redirect_to user_post_url(id: post_id)
    end
  end
end
