class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy
  accepts_nested_attributes_for :order_details

  enum payment_method: {
    credit_card: 0,
    transfer: 1,
  }

  enum status: {
    waiting_for_payment: 0,
    payment_confirmation: 1,
    cooking: 2,
    preparing_to_ship: 3,
    shipped: 4,
  }

  def full_address
    '〒' + self.postal_code + ' ' + self.address
  end

end
