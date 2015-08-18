class AccountsController < ApplicationController

  def index
    login(User.first)
    @accounts = Account.all
  end

  def show
    @account = Account.find_by_id(params[:id])
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      redirect_to @account
    else
      render 'new'
    end
  end

  def edit
    @account = Account.find_by_id(params[:id])
  end

  def update
    @account = Account.find_by_id(params[:id])

    if @account.update(account_params)
      redirect_to @account
    else
      render 'edit'
    end
  end

  private
  def account_params
    params.require(:account).permit(:name, :catch_phrase, :street, :city, :state, :zip, :logo, :user_id)
  end
end


