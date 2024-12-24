class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :redirect_if_invalid_access, only: [:index, :create]
  before_action :set_payjp_public_key, only: [:index, :new]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order = Order.new
  end

  def new
    @item = Item.find(params[:item_id])
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
  end

  def create
    @order = Order.new(order_params)

    if @order.valid?
      token = params[:token] # トークンパラメータの取得
      charge_customer(token: token, amount: @item.price)
      @order.save
      redirect_to root_path
    else
      Rails.logger.debug("Order validation errors: #{@order.errors.full_messages.join(', ')}") # バリデーションエラーをログ出力
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def set_payjp_public_key
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
  end

  def charge_customer(token:, amount:)
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: amount,
      card: token,
      currency: 'jpy'
    )
  end

  def redirect_if_invalid_access
    return unless @item.user_id == current_user.id || @item.orders.exists?

    redirect_to root_path
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(
      token: params[:token],
      user_id: current_user.id,
      item_id: params[:item_id]
    )
  end
end
