class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    if @item.user == current_user || !@item.order.nil?
      redirect_to root_path
    else
      @order_address_book = OrderAddressBook.new
    end
  end

  def create
    @order_address_book = OrderAddressBook.new(order_address_book_params)
    if @order_address_book.valid?
      pay_item
      @order_address_book.save
      redirect_to root_path
      nil
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_address_book_params
    params.require(:order_address_book).permit(:postcode, :prefecture_id, :city, :block, :building, :mobile).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_address_book_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
