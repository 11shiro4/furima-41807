class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
  end

  def new
    @item = Item.new
    render 'new'
  end

  # def create
  #   @item = Item.new(item_params)
  #  @item.user = current_user
  #  if @item.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  def create
    @item = Item.new(item_params)
    if @item.save
      respond_to do |format|
        format.html { redirect_to @item }
      end
    else
      respond_to do |format|
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
