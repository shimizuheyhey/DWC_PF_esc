class UsersController < ApplicationController

  def index
   #@user = User.all
    @q = User.ransack(params[:q])
    @user = @q.result(distinct: true)
  end

  def edit
   @user = User.find(params[:id])
  end

  def show
   @user = User.find(params[:id])


  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)

  end


  private

  def user_params
    params.require(:user).permit(:id, :name)
  end
 end
