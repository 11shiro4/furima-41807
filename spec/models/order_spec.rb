require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '注文の保存' do
    context '注文が保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end

      it '建物名が空でも保存できること' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end

    context '注文が保存できない場合' do
      it '郵便番号が空では保存できないこと' do
        @order.postcode = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postcode can't be blank")
      end

      it '郵便番号にハイフンがなければ保存できないこと' do
        @order.postcode = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postcode は「3桁ハイフン4桁」の半角文字列で入力してください')
      end

      it '都道府県が空では保存できないこと' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空では保存できないこと' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では保存できないこと' do
        @order.block = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Block can't be blank")
      end

      it '電話番号が空では保存できないこと' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が9桁以下では保存できないこと' do
        @order.phone_number = '090123456'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number は10桁以上11桁以内の半角数値で入力してください')
      end

      it '電話番号が12桁以上では保存できないこと' do
        @order.phone_number = '090123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid. Must be 10 to 11 digits')
      end

      it '電話番号にハイフンが含まれていると保存できないこと' do
        @order.phone_number = '090-1234-5678'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid. Must be 10 to 11 digits')
      end

      it 'tokenが空では保存できないこと' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it 'クレジットカード情報が空では保存できないこと' do
        @order.credit_card_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Credit card number can't be blank")
      end
    end
  end
end
