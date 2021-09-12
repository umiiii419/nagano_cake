class Address < ApplicationRecord

  belongs_to :customer, optional: true

  def full_address
    '〒' + self.postal_code + ' ' + self.address + ' ' + self.name
  end

  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true

end
