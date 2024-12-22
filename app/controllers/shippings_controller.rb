class ShippingsController < ApplicationController
  def index
    @shippings = Shipping.all
  end

  def show
    @shipping = Shipping.find(params[:id])
  end

  def new
    @shipping = Shipping.new
  end

  def create
    @shipping = Shipping.new(shipping_params)
    if @shipping.save
      redirect_to @shipping
    else
      render :new
    end
  end

  def edit
    @shipping = Shipping.find(params[:id])
  end

  def update
    @shipping = Shipping.find(params[:id])
    if @shipping.update(shipping_params)
      redirect_to @shipping
    else
      render :edit
    end
  end

  def destroy
    @shipping = Shipping.find(params[:id])
    @shipping.destroy
    redirect_to shippings_path
  end

  private

  def shipping_params
    params.require(:order).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number)
  end
end
