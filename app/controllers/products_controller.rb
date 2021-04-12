class ProductsController < ApplicationController
    def index
      @products = Product.order("created_at DESC")
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
      params.require(:product).permit(:name, :category_id, :status_id, :explanation_id, :area_id, :delivery_day_id, :price, :information, :user)
    end
end
