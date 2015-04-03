class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new( comment_params )
    if @comment.save
      respond_to do |format|
        format.html { redirect_to post_path(@comment.post) }
          flash[:notice] = "Your comment is posted!"
        format.js
      end
    else
      flash[:alert] = "Something went wrong."
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.update( comment_params )
      flash[:notice] = "Comment updated"
      redirect_to post_path(@comment.post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to posts_path }
      flash[:notice] = "Your post has been deleted!"
      format.js
    end
  end

private
  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end
end
