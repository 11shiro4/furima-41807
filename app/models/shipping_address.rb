class ShippingAddress < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :block, presence: true
  validates :token, presence: true
  validates :item_id, presence: true
  validates :user_id, presence: true
end
