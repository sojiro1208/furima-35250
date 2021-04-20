# 購入のコントローラー
class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create] #←ログインしていない状態だとログインを促す
  before_action :move_to_index, only:[:index, :create]

  def index
    @product = Product.find(params[:product_id])
    @purchase_send = PurchaseSend.new
  end

  def create
    @product = Product.find(params[:product_id])
    @purchase_send = PurchaseSend.new(parchase_params)
    if @purchase_send.valid?
      pay_item
      @purchase_send.save
      redirect_to root_path
    else
      render 'index'
    end
  end
  
  private

  def parchase_params
    params.require(:purchase_send).permit(:postal_code, :area_id, :municipal_district, :address_number, :name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_item
    @product = Product.find(params[:product_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,  # 商品の値段
      card: parchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def move_to_index
    @product = Product.find(params[:product_id])
    if @product.purchase.present? || @product.user.id == current_user.id
        redirect_to root_path
    end
  end
end
