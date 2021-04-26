# メッセージのバリデーション＆アソシエーション

class Message < ApplicationRecord
 
 belongs_to :user
 belongs_to :product
 
  # with_options presence: true do
  #   validates :message
  #   validates :user
  #   validates :product
  # end
end
