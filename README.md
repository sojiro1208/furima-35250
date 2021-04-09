# README

## user
 Column      | Type    | Options     |
| ---------- | ------- | ----------- |
| first_name | string  | null: false |
| last_name  | string  | null: false |
| nicname    | string  | null: false |
| furigana   | string  | null: false |
| birthday   | string  | null: false |
| email      | string  | null: false ,unique: true |
| password   | string  | null: false |

### Association
has_many :product
has_many :purchase




## product
 Column       | Type    | Options     |
| ----------- | ------- | ----------- |
| name        | string  | null: false |
| image       |   ActiveStorageで実装  |
| burden      | text    | null: false |
| category    | string  | null: false |
| status      | string  | null: false |
| explanation | text    | null: false |
| area        | string  | null: false |
| days        | string  | null: false |
| price       | string  | null: false |
| information | text    | null: false |
| seller      | string  | null: false |

### Association
belongs_to :user
has_one :purchase("子")




## purchase
Column       | Type    | Options           |
| ---------- | ------- | ----------------- |
| buyer      | string  | foreign_key: true |
| what       | string  | foreign_key: true |

### Association
has_one :product("親")
belongs_to :user
has_many :shipping




## shipping名
 Column        | Type    | Options       |
| ------------ | ------- | ------------- |
| address      | string  | null: false	 |
| postal_code  | string  | null: false	 |
| todoufuken   | string  | null: false	 |
| sityouson    | string  | null: false	 |
| number       | string  | null: false	 |
| phone_number | string  | null: false	 |

### Association
belongs_to :purchase