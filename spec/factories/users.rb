# ユーザーFactoryBot
FactoryBot.define do
  factory :user do
    nickname {"ファルコンランチ"}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6) + "a1"
    password {password}
    password_confirmation {password}
    first_name {"のび太"}
    last_name {"野比"}
    first_name_kana {"ノビタ"}
    last_name_kana {"ノビ"}
    birthday {"1996-06-02"}
  end
end