class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:username])
    if user.authenticate(params[:password])
      login(user)
      redirect_to accounts_path
    else
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to 'new'
  end

# private

#   def user_params
#     params.require(:user).permit(:username, :password)
#   end
end
