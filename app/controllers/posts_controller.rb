class PostsController < ApplicationController
  def new
    @post_image = Post.new
  end

  def create
    @post_image = Post.new(post_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to posts_path
  end

  def index
     @post_image = Post.all
  end

  def show
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :image_id, :body)
  end
end
