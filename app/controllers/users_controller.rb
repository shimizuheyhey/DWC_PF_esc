class UsersController < ApplicationController

  def index

  end

  def self.show
  @user = User.find(params[:id])
  end

  def update

  end


  private

  def user_params
    params.require(:user).permit(:id, :name)
  end
 end
