class Public::AddressesController < ApplicationController

  def index
    @addresses = Address.all
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to addresses_path
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
  end

  private
  def address_params
    params.require(:address).permit(:name, :postal_code, :address, :customer_id)
  end

end
