class UsersController < ApplicationController
  before_action :authenticate_user!, :except => [:home]
  def home
      if user_signed_in?
        redirect_to user_path(current_user)
      end
  end

  def show

  end
end
