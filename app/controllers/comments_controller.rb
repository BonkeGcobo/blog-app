class CommentsController < ApplicationController
  def new
    respond_to do |format|
      format.html { render :new, locals: { comment: Comment.new } }
    end
  end

  def create
    user = current_user
    post = Post.find_by(id: post_params.to_i)
    comment = Comment.new(comment_params)
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


  private 
  def comment_params
    params.require(:comment).permit(:Text)
  end

  private 
  def post_params
    params.require(:post_id)
  end
end
