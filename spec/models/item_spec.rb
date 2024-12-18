require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.user = @user
  end

  describe '商品出品' do
    context '商品出品ができるとき' do
      it '必要な情報を適切に入力して「出品する」ボタンを押すと、商品情報がデータベースに保存される' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it '商品画像を1枚つけることが必須である' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が必須である' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品の説明が必須である' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーの情報が必須である' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態の情報が必須である' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担の情報が必須である' do
        @item.shipping_payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping payer can't be blank")
      end

      it '発送元の地域の情報が必須である' do
        @item.shipping_region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping region can't be blank")
      end

      it '発送までの日数の情報が必須である' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it '価格の情報が必須である' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格は¥300~¥9,999,999の間のみ保存可能である' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '価格は半角数値のみ保存可能である' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'エラーハンドリングができること（入力に問題がある状態で「出品する」ボタンが押された場合、情報は保存されず、出品ページに戻りエラーメッセージが表示される）' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'エラーハンドリングの際、重複したエラーメッセージが表示されない' do
        @item.item_name = ''
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to eq(["Item name can't be blank", "Description can't be blank"])
      end
    end
  end
end
