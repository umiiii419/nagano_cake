class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id].to_i)
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end
    @sum = 0
  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      @order_details = @order.order_details.new
      @order_details.item_id = cart_item.item.id
      @order_details.price = cart_item.amount
      @order_details.amount = cart_item.item.price
      @order_details.save
      current_customer.cart_items.destroy_all
    end
    redirect_to order_thanks_path
  end

  def index
    @orders =  current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
    @sum = 0
  end

  private
  def order_params
    params.require(:order).permit(
      :payment_method,
      :select_address,
      :postal_code,
      :address,
      :name,
      :shipping_cost,
      :total_payment,
      :created_at )
  end
end
