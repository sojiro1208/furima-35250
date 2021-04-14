class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update] #←ログインしていない状態だとログインを促す
  before_action :move_to_index, only:[:edit] #⇦指定したアクションがリクエストされた場合、アクションの前に処理を行う
  before_action :set_product, only:[:show, :edit, :update]


    def index
      @products = Product.all.order("created_at DESC")
    end

    def new 
        @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to root_path 
      else
        render :new
      end
    end

    def show
    end

    def edit
    end

    def update
      if
        @product.update(product_params)
        redirect_to product_path(@product.id)
      else
        render :edit
      end
    end

    private
    def product_params
      params.require(:product).permit(:name, :category_id, :status_id, :shipping_id, :area_id, :delivery_day_id, :price, :information, :image).merge(user_id: current_user.id)
    end

    def set_product
      @product = Product.find(params[:id])
    end

    def move_to_index
      @product = Product.find(params[:id])
      unless @product.user == current_user
        redirect_to action: :index
      end
    end
    # befor actionの処理内容↑
end
