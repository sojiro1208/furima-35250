class Product < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_day
  belongs_to :area
  belongs_to :shipping
  belongs_to :status


  with_options presence: true do
    validates :name
    validates :category_id
    validates :status_id
    validates :shipping_id
    validates :area_id
    validates :delivery_day_id
    validates :information
    validates :user
    validates :image
  end

  validates :price,                numericality: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, presence: true

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id   
    validates :status_id
    validates :shipping_id
    validates :area_id
    validates :delivery_day_id
  end
 
end
