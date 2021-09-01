class Admin::ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
    @genre = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
  　redirect_to admin_item_path(@item.id)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre, :price, :is_active)
  end


end
