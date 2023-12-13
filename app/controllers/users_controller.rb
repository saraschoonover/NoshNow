class UsersController < ApplicationController
  def profile
    @user = current_user
    authorize @user, policy_class: UserPolicy
  end
end
