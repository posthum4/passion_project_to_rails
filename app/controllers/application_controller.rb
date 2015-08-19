class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

helper_method :current_user, :login, :logged_in?, :logout, :find_user, :bounce

  def logged_in?
    !!session[:user_id]
  end

  def guest_user?
    !logged_in?
  end

  def current_user
    @user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session[:user_id] = nil
  end

  def bounce
    redirect_to users_path unless current_user
  end
end
