class Item < ApplicationRecord
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :schedule_deliver

  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :schedule_deliver_id, presence: true
  has_one_attached :image
end
