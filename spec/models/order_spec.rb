require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '注文の保存' do
    context '注文が保存できる場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end
    end

    context '注文が保存できない場合' do
      it 'addressが空だと保存できないこと' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it 'credit_card_numberが空だと保存できないこと' do
        @order.credit_card_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Credit card number can't be blank")
      end

      # 他のバリデーションテストを追加する
    end
  end
end
