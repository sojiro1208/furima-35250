require 'rails_helper'

RSpec.describe PurchaseSend, type: :model do
  describe '購入機能' do
    before do
      @user = FactoryBot.create(:user) #ここでuserのファクトリーボットを使う
      @product = FactoryBot.create(:product, user_id: @user.id)
      @purchase = FactoryBot.build(:purchase_send, product_id: @product.id, user_id: @user.id)
      # sleep(2) ⇦処理の間隔を作りDBの処理速度を保つ
    end

    context '登録できる時' do

      it '全部埋めれば登録できる' do
        expect(@purchase).to be_valid
      end
    end

    context '登録できない時' do

      it '郵便番号がからの場合登録できない' do
        @purchase.postal_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end

      it '郵便番号が「-」がない場合登録できない' do
        @purchase.postal_code = 0000000
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code is invalid")
      end

      it '郵便番号が足りない場合登録できない' do
        @purchase.postal_code = 0-0
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code is invalid")
      end

      it '郵便番号が多い場合登録できない' do
        @purchase.postal_code = 0000-00000
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code is invalid")
      end

      it '都道府県がからの場合登録できない' do
        @purchase.area_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Area can't be blank", "Area is not a number")
      end

      it '都道府県が1の場合登録できない' do
        @purchase.area_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Area must be other than 1")
      end

      it '市町区村がからの場合登録できない' do
        @purchase.municipal_district = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Municipal district can't be blank")
      end

      it '番地がからの場合登録できない' do
        @purchase.address_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Address number can't be blank")
      end

      it '電話番号がからの場合登録できない' do
        @purchase.phone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end

      it '電話番号が９以下場合登録できない' do
        @purchase.phone_number = 000000000
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が１２以上ある場合登録できない' do
        @purchase.phone_number = 000000000000
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号にハイフンがある場合登録できない' do
        @purchase.phone_number = 000-0000-0000
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is invalid")
      end

      it 'tokenがからの場合登録できない' do
        @purchase.token = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
