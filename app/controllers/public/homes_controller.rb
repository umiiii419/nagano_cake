class Public::HomesController < ApplicationController

  def top
    @items = current_customer.items.all
  end

  def about
  end

end
