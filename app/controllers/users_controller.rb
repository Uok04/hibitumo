class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end
end

private

  def user_params
    params.require(:user).permit(:avatar).merge(user_id: current_user.id)
  end