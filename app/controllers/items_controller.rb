class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
    render 'new'
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @categories = Category.all
    @sales_statuses = Status.all # ここで@sales_statusesを正しく設定する
    @shipping_fee_statuses = ShippingCost.all
    @prefectures = Prefecture.all
    @scheduled_deliveries = ShippingDate.all
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    respond_to do |format|
      if @item.save
        format.html { redirect_to root_path }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :category_id, :status_id, :description, :shipping_cost_id, :prefecture_id,
                                 :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end
end
