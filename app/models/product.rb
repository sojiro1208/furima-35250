class Product < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_day
  belongs_to :area
  belongs_to :shipping
  belongs_to :status

  validates :name,           presence: true
  validates :category_id,         presence: true
  validates :status_id,           presence: true
  validates :shipping_id,      presence: true
  validates :area_id,             presence: true
  validates :delivery_day_id,     presence: true
  validates :price,                numericality: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, presence: true
  validates :information,            presence: true
  validates :user,             presence: true
  validates :image,           presence: true

  validates :category_id,     numericality: { other_than: 1 } 
  validates :status_id,       numericality: { other_than: 1 } 
  validates :shipping_id,  numericality: { other_than: 1 } 
  validates :area_id,         numericality: { other_than: 1 } 
  validates :delivery_day_id, numericality: { other_than: 1 } 
  # numericality→数字のバリデーション
 
end
