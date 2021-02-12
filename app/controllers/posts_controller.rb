class PostsController < ApplicationController
  def new
    @post = Post.new
    @cut_time = @post.cut_times.new
  end

  def create
    @post = Post.new(post_params)
    #binding.pry
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def index
     @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :body,
      cut_times_attributes: [:id, :post_id, :minute, :second])
  end
end
