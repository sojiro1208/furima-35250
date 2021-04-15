# README

## users
 Column              | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| nickname           | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birthday           | date    | null: false               |
| email              | string  | null: false ,unique: true |
| encrypted_password | string  | null: false               |

### Association
has_many :products
has_many :purchases




## products
 Column           | Type    | Options     |
| --------------- | ------- | ----------- |
| name            | string  | null: false |
| category_id     | integer | null: false |
| status_id       | integer | null: false |
| shipping_id  | integer | null: false |
| area_id         | integer | null: false |
| delivery_day_id | integer | null: false |
| price           | integer | null: false |
| information     | text    | null: false |
| user            | references | foreign_key: true  |

### Association
belongs_to :user
has_one :purchase("子")




## purchases
Column       | Type        | Options           |
| ---------- | ----------- | ----------------- |
| user       | references  | foreign_key: true |
| product    | references  | foreign_key: true |

### Association
belongs_to :product("親")
belongs_to :user
has_one :send




## sends
 Column              | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| address            | string     | null: false       |
| postal_code        | string     | null: false       |
| area_id            | integer    | null: false       |
| municipal_district | string     | null: false       |
| address_number     | string     |
| phone_number       | string     | null: false       |
| purchase           | references | foreign_key: true |
### Association
belongs_to :purchase