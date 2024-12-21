class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_sold_out, only: [:edit, :update]
  before_action :set_form_collections, only: [:show, :edit, :update]
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
    render 'new'
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit, status: :unprocessable_entity
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

  def set_item
    @item = Item.find(params[:id])
  end

  def set_form_collections
    @categories = Category.all
    @statuses = Status.all
    @shipping_costs = ShippingCost.all
    @prefectures = Prefecture.all
    @shipping_dates = ShippingDate.all
  end

  def redirect_if_sold_out
    return unless @item.user != current_user

    redirect_to root_path
  end

  def item_params
    params.require(:item).permit(:item_name, :category_id, :status_id, :description, :shipping_cost_id, :prefecture_id,
                                 :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end
end
