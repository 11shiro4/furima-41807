class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :redirect_if_invalid_access, only: [:index, :create]

  def index
    @order = Order.new
  end

  def new
    @item = Item.find(params[:item_id])
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
  end

  def create
    @order = Order.new(order_params.merge(user_id: current_user.id, item_id: params[:item_id]))

    @order.user_id = current_user.id
    @order.item_id = params[:item_id]

    if @order.valid?
      charge_customer(token: params[:order][:token], amount: @item.price)
      @order.save
      redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

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
    params.require(:order).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number)
  end

  def order_form_params
    params.require(:order_form).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number, :token).merge(
      user_id: current_user.id, item_id: params[:item_id]
    )
  end
end
