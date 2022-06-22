class CommentsController < ApplicationController
  def new
    respond_to do |format|
      format.html { render :new, locals: { comment: Comment.new } }
    end
  end

  def create
    user = current_user
    post_id = params[:post_id]
    post = Post.find_by(id: post_id.to_i)
    params.permit!
    comment = Comment.new(params[:comment])
    comment.user = user
    comment.post = post

    if comment.save
      flash[:notice] = 'Post saved successfully'
      comment.update_comments_counter
      redirect_to user_post_url(id: post.id)
    else
      flash[:alert] = 'Error: Post could not be saved'
      redirect_to user_post_url(id: post_id)
    end
  end
end
