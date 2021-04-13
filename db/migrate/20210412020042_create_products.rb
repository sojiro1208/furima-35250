# 商品登録のマイグレーション
class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string     :name,            null: false
      t.integer    :category_id,     null: false
      t.integer    :status_id,       null: false
      t.integer    :shipping_id,  null: false
      t.integer    :area_id,         null: false
      t.integer    :delivery_day_id, null: false
      t.integer    :price,           null: false
      t.text       :information,     null: false
      t.references :user,            foreign_key: true
      t.timestamps
    end
  end
end
