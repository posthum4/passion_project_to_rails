class OrdersController < ApplicationController
  def new
    @order = Order.new
    render '_form', layout: false
  end

  def create
    p params
    p "LOOK UP FOR PARAMS"
    @account = Account.find_by(id: order_params[:account_id])
    @order = Order.new(order_params)
    if @order.save
      redirect_to account_path(@account)
    else
      render 'new'
    end

  end

  def show
  end

  def edit
  end

  def index
  end

private
  def order_params
    params.require(:order).permit(:account_id, :close_date, :status, :payment_terms)
  end

end
