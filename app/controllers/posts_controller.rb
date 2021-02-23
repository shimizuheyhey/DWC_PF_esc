class PostsController < ApplicationController
  def new
    @post = Post.new
    @cut_time = @post.build_cut_time(user_id: current_user.id )
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    cut_time = @post.build_cut_time(cut_time_params)
    cut_time.user_id = current_user.id
    #@post.cut_times << cut_time
    if @post.save && cut_time.save
      redirect_to posts_path
    else
      #byebug
      render 'new'
    end
  end

#array = @post.pluck(:分数のカラム)
#total01 = array.sum{ |num| num * 60 }
#total02 = @post.pluck(:秒数のカラム).inject(:+)
#total = total01 + total02

  def index
     @posts = Post.all
     @tags = Post.tag_counts_on(:tags).most_used(20)
     #@cut_time = @post.cut_times.first
     #@ranks = @posts.find(Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @cut_time = @post.cut_time
  end

  def edit
    @post = Post.find(params[:id])

  end

  def update
    @post = Post.find(params[:id])

    #@post.user_id = current_user.id
    #cut_time = CutTime.find(params[:id]),(cut_time_params["cut_times_attributes"]["0"])
    #cut_time.user_id = current_user.id
    #@post.cut_times << cut_time

    if @post.update(post_params)
    redirect_to posts_path
    else
    render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :body, :tag_list)
  end

  def cut_time_params
    params.require(:post).permit(cut_times: [:minute, :second])[:cut_times]

  end
end