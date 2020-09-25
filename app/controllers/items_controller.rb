class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image, :products_name, :description, :category_id, :status_id, :delivery_fee_id, :shipping_place_id, :day_to_ship_id, :price, ).merge(user_id: current_user.id)
  end
end
