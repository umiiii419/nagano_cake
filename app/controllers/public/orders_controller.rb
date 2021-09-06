class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to order_confirm_path
  end

  def index
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :selected_address, :postal_code, :address, :name )
  end

end
