class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    return if @user = User.find_by(id: params[:id])

    flash[:danger] = t "not_found"
    redirect_to root_url
  end

  def  create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "welcome_to_the_sample_app"
      redirect_to @user
    else
      flash[:danger] = t "registration_failed"
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end
