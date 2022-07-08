class ApplicationController < ActionController::Base
  def require_authentication
    flash[:alert] = 'You must be signed in to perform that action' unless user_signed_in?
    redirect_to posts_path unless user_signed_in?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    # converts current_user to a boolean by negating the negation
    !!current_user
  end
end
