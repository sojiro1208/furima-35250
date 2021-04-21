FactoryBot.define do
  factory :purchase_send do
    postal_code {"000-0000"}
    area_id {2}
    municipal_district {"江南市"}
    address_number {"江守12-2"}
    name {"ライオンズマンション"}
    phone_number {"09000003333"}
    token{'tok_a24fa5dc79c06409a6ddf1879fa3'}
  end
end
