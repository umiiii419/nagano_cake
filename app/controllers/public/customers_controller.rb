class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer)
  end

  def unsubscribe
  end

  def withdrawal
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :id_active)
  end


end
