class Authentication::UsersController < ApplicationController
  def new
    @user = User.new
  end
  {
    user_id: 1
  }
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to products_path, notice: t('.created')
    else
      render :new, status: :unprocessable_entity
    end
  end
  private
  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end