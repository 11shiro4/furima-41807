class ItemsController < ApplicationController
  before_action :set_form_collections, only: [:new, :create]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id,
                                 :scheduled_delivery_id)
  end

  def set_form_collections
    @categories = Category.all
    @sales_statuses = SalesStatus.all
    @shipping_fee_statuses = ShippingFeeStatus.all
    @prefectures = Prefecture.all
    @scheduled_deliveries = ScheduledDelivery.all
  end
end
