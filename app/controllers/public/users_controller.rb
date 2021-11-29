class Public::UsersController < ApplicationController
  def show
    @user=current_public_user
  end

  def destory
    @user=current_public_uder
    @user.destroy
    redirect_to root_path
  end
end
