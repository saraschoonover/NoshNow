class UsersController < ApplicationController
  def profile
    @restaurants = Favorite.where(favoritor: @user)
  end
end
