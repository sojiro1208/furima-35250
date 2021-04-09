# README

## user
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




## product
 Column          | Type    | Options     |
| -------------- | ------- | ----------- |
| name           | string  | null: false |
| burden         | text    | null: false |
| category_id    | integer | null: false |
| status_id      | integer | null: false |
| explanation_id | integer | null: false |
| area_id        | integer | null: false |
| days_id        | integer | null: false |
| price          | integer | null: false |
| information    | text    | null: false |
| seller         | string  | null: false |

### Association
belongs_to :user
has_one :purchase("子")




## purchase
Column       | Type        | Options           |
| ---------- | ----------- | ----------------- |
| user       | references  | foreign_key: true |
| product    | references  | foreign_key: true |

### Association
has_one :product("親")
belongs_to :user
has_many :shippings




## shipping名
 Column              | Type    | Options       |
| ------------------ | ------- | ------------- |
| address            | string  | null: false	 |
| postal_code        | string  | null: false	 |
| area_id            | integer | null: false	 |
| municipal_district | string  | null: false	 |
| number             | string  | null: false	 |
| phone_number       | string  | null: false	 |

### Association
belongs_to :purchase