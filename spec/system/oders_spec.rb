require 'rails_helper'

RSpec.describe 'Order', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: @user.id, item_id: @item.id)
    sign_in @user
  end

  it 'クレジットカードの情報が正しければ購入できる' do
    visit new_order_path(item_id: @item.id)
    fill_in 'カード番号', with: '4242424242424242'
    fill_in '有効期限(月)', with: '12'
    fill_in '有効期限(年)', with: '24'
    fill_in 'セキュリティコード', with: '123'
    fill_in '郵便番号', with: '123-4567'
    select '東京都', from: 'order_prefecture_id'
    fill_in '市区町村', with: '渋谷区'
    fill_in '番地', with: '1-1-1'
    fill_in '電話番号', with: '09012345678'
    click_button '購入'
    expect(page).to have_content('購入が完了しました')
  end
end
