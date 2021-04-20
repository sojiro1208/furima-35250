# formオブジェクトのやつモデルもどき

class PurchaseSend
  include ActiveModel::Model #←バリデーションを使用するためのもの //モデルの継承で検索
  attr_accessor :postal_code, :area_id, :municipal_district, :address_number, :name, :phone_number, :user_id, :product_id, :token #保存したいカラム名


  with_options presence:true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :area_id, numericality: { other_than: 1 }
    validates :municipal_district
    validates :address_number
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :user_id
    validates :product_id
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, product_id: product_id)
    SendAddress.create(postal_code: postal_code, area_id: area_id, municipal_district: municipal_district, address_number: address_number, name: name, phone_number: phone_number, purchase_id: purchase.id)
  end
end