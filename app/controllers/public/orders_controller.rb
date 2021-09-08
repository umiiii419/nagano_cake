class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
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
    params.require(:order).permit(:payment_method, :select_address, :postal_code, :address, :name )
  end

end
