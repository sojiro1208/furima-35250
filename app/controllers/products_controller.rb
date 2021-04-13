class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create] 
  # ログインしていない状態だとログインを促す↑

  # before_action :move_to_index, only:[:new, :create]


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

    private
    def product_params
      params.require(:product).permit(:name, :category_id, :status_id, :shipping_id, :area_id, :delivery_day_id, :price, :information, :image).merge(user_id: current_user.id)
    end

    def move_to_index
      unless user_signed_in?
        redirect_to action: :index
      end
    end
end
