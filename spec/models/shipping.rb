class Shipping < ApplicationRecord
  belongs_to :order

  validates :order, presence: true
  validates :postcode, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :building, presence: true
  validates :phone_number, presence: true
end
