class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
  end

  def new
    @item = Item.new
    render 'new'
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
    params.require(:item).permit(:category, :status, :shipping_cost, :prefecture, :shipping_date)
  end
end
