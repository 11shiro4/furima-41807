class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  def index
    @order = Order.new
  end

  def new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.item_id = params[:item_id]

    if @order.valid?
      charge_customer(token: params[:stripeToken])
      @order.save
      redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def charge_customer(token:)
    item = Item.find(@order.item_id)
    Stripe::Charge.create({
                            amount: item.price,
                            currency: 'jpy',
                            description: '購入商品の説明',
                            source: token
                          })
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
