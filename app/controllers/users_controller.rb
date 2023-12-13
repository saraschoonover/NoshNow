class UsersController < ApplicationController
  def profile
   authorize @user = current_user
  end
end
