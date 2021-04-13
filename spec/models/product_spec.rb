require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '商品新規登録' do
    before do
      @user = FactoryBot.create(:user) #ここでuserのファクトリーボットを使う
      @product = FactoryBot.build(:product, user_id: @user.id)
    end

    context '登録ができる時' do

      it '全部埋めれば登録できる' do
        expect(@product).to be_valid
      end
    end

    context '登録ができない時' do

      it 'nameが空では登録できぬ' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it 'category_idが空では登録できぬ' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end

      it 'status_idが空では登録できぬ' do
        @product.status_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Status can't be blank", "Status is not a number")
      end

      it 'shipping_idが空では登録できぬ' do
        @product.shipping_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping can't be blank", "Shipping is not a number")
      end

      it 'area_idが空では登録できぬ' do
        @product.area_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Area can't be blank", "Area is not a number")
      end

      it 'delivery_day_idが空では登録できぬ' do
        @product.delivery_day_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery day can't be blank", "Delivery day is not a number")
      end

      it 'priceが空では登録できぬ' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number", "Price can't be blank")
      end

      it 'informationが空では登録できぬ' do
        @product.information = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Information can't be blank")
      end

      it 'priceが299円では登録できぬ' do
        @product.price = '299'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceが全角数字ではでは登録できぬ' do
        @product.price = '１０００'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end

      it 'imageが空では登録できぬ' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

    end
  end
end
