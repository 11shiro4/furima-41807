require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '注文の保存' do
    context '注文が保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end

      it '建物名が空でも保存できること' do
        @order_form.building = ''
        expect(@order_form).to be_valid
      end
    end

    context '注文が保存できない場合' do
      it '郵便番号が空では保存できないこと' do
        @order_form.postcode = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postcode can't be blank")
      end

      it '郵便番号にハイフンがなければ保存できないこと' do
        @order_form.postcode = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postcode は「123-4567」の形式で入力してください')
      end

      it '都道府県が1以外でないと保存できないこと' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it '市区町村が空では保存できないこと' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では保存できないこと' do
        @order_form.block = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Block can't be blank")
      end

      it '電話番号が空では保存できないこと' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number は10桁以上11桁以内の半角数値で入力してください')
      end

      it '電話番号が9桁以下では保存できないこと' do
        @order_form.phone_number = '090123456'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number は10桁以上11桁以内の半角数値で入力してください')
      end

      it '電話番号が12桁以上では保存できないこと' do
        @order_form.phone_number = '090123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number は10桁以上11桁以内の半角数値で入力してください')
      end

      it '電話番号にハイフンが含まれていると保存できないこと' do
        @order_form.phone_number = '090-1234-5678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number は10桁以上11桁以内の半角数値で入力してください')
      end

      it 'tokenが空では保存できないこと' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
