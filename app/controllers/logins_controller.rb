class LoginsController < ApplicationController
  def new
    user = User.find_by(id: session[:user_id])
    redirect_to posts_path if user
    @user = User.new
  end

  def create
    @user = User.find_by(login_params)

    if @user
      session[:user_id] = @user.id
      flash[:success] = 'You have been logged in'
      redirect_to posts_path
    else
      flash[:alert] = 'Email or password is incorrect -- please try again'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    reset_session
    flash[:success] = 'You have been logged out'
    redirect_to posts_path
  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
