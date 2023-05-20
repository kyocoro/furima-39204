class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, except: [:index, :create]

  def index
    @order_purchase = OrderPurchase.new
    if @item.order.present?
      redirect_to root_path
    end
    if user_signed_in? && current_user.id == @item.user_id
    else
      redirect_to root_path
    end
    if user_signed_in?
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @order_purchase = OrderPurchase.new
  end

  def create
    @order_purchase = OrderPurchase.new(order_params)
    if @order_purchase.valid?
      pay_item
      @order_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_purchase).permit(:postcode, :region_id, :municipalities, :address, :building_name, :telephone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    #params.require(:order_purchase).permit(:cardnumber, :expiration, :securitycode).merge(token: params[:token])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:id])
  end
end