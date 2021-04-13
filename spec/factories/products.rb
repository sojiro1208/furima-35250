# 商品登録のファクトリーぼっと
FactoryBot.define do
  factory :product do
    name {"那須ハイランドパーク"}
    category_id {2}
    status_id {2}
    shipping_id {2}
    area_id {2}
    delivery_day_id {2}
    price {1000}
    information {"楽しいよ"}
  #  association :user ⇦これだけでも可能

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
