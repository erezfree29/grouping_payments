class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:home]
  def home
    redirect_to user_path(current_user) if user_signed_in?
  end

  def show
    @user = User.find(params[:id])
  end
end
