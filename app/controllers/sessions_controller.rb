class SessionsController < ApplicationController
  def new
    @user = User.new
    render :login
  end

  def create
    user = user.find_by(username: params[:session][:username])
    if user.password == params[:session][:password]
      session[:user_id] = user.id
      redirect_to accounts_path
    else
      redirect_to root_path
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
