class CreateSends < ActiveRecord::Migration[6.0]
  def change
    create_table :sends do |t|
      t.string     :postal_code,        null: false
      t.integer    :area_id,            null: false
      t.string     :municipal_district, null: false
      t.string     :address_number,     null: false
      t.string     :phone_number,       null: false
      t.string     :name,               null: false
      t.references :purchase,           foreign_key: true
      t.timestamps
    end
  end
end

