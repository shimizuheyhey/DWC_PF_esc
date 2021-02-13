class PostsController < ApplicationController
  def new
    @post = Post.new
    @cut_time = @post.cut_times.new
  end

  def create
    #@post = Post.new(post_params)
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    cut_time = CutTime.new(cut_time_params[0])
    cut_time.user_id = current_user.id
    @post.cut_times << cut_time

    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def index
     @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @time = @post.cut_times
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
    params.require(:post).permit(:title, :image, :body)
  end

  def cut_time_params
        params.require(:post).permit(
      cut_times_attributes: [:id, :post_id, :minute, :second])
  end
end