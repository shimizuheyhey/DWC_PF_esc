class UsersController < ApplicationController

  def index
   #@user = User.all
    @q = User.ransack(params[:q])
    @user = @q.result(distinct: true)
    @users = User.all
  end

  def edit
   @user = User.find(params[:id])
   if @user.id != current_user.id
       redirect_to user_path(current_user.id)
    end
  end

  def show
   @user = User.find(params[:id])
   @bookmarks = Bookmark.where(user_id: current_user.id)
   @post = @user.posts
  end

  def bookmark
    @bookmarks = Bookmark.where(user_id: current_user.id)
    total_second = 0
    @bookmarks.each do |bookmark|
      cut_time = bookmark.post.cut_time

      total_second += cut_time.minute * 60
      total_second += cut_time.second
    end

    @minute = total_second / 60
    @second = total_second % 60
     # @bookmarks.cut_times.each do |cut_time|
       # @total_time << cut_time.minute * bookmark.count
      #end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user)
    else
    render :edit
    end

  end


  private

  def user_params
    params.require(:user).permit(:id, :name, :body, :profile_image)
  end
 end
