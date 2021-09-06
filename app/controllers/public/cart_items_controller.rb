class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(amount: params[:amount].to_i)
  end

  def destroy
    @cart_item.destroy
  end

  def destroy_all
  end

  def create
    @item = Item.find(cart_item_params[:item.id])
  end


  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end
