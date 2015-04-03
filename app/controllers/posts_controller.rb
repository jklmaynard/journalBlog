class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new(params[:post])
  end

  def create
    @post = Post.new( post_params )
    @user =
    if @post.save
      flash[:notice] = "Your post has been added!"
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update( post_params )
      flash[:notice] = "Your post has been updated!"
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Your post has been deleted!"
    redirect_to posts_path
  end


private
  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
