class Purchase < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_one :send_address
end
