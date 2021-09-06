class CartItem < ApplicationRecord

  attachment :image
  belongs_to :item
  belongs_to :customer

end
