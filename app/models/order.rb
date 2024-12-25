class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  attr_accessor :token

  validates :postcode, format: { with: /\A\d{3}-\d{4}\z/, message: 'は「3桁ハイフン4桁」の半角文字列で入力してください' }
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: 'は10桁以上11桁以内の半角数値で入力してください' }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :city, presence: true
  validates :block, presence: true
  validates :token, presence: true
end
