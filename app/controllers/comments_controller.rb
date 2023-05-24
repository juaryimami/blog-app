class CommentsController < ApplicationController
  def create
    @user = current_user
    @user_post = User.find(params[:user_id])
    @comment = @user.comments.new(comments_params)
    @comment.author_id = @user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      flash[:notice] = 'Comment published succesfully'
      redirect_to user_post_path(@user_post.id, Post.find(params[:post_id]))
    else
      flash[:error] = 'Comment was not published'
      render :new
    end
  end

  def destroy
    @user_post = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to user_post_path(@user_post.id, @post)
  end

  def comments_params
    params.require(:comment).permit(:text)
  end
end
