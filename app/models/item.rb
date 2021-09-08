class Item < ApplicationRecord

  attachment :image
  belongs_to :genre

  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  def with_tax_price
      (self.price * 1.1 ).floor
  end

end
