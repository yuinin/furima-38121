# テーブル設計

## users テーブル

| Column             | Type   | Options                      |
| ------------------ | ------ | ---------------------------- |
| nickname           | string | null: false,                 |
| email              | string | null: false, unique: true    |
| encrypted_password | string | null: false, 全角漢字,かな,カナ |
| first_name         | string | null: false, 全角漢字,かな,カナ |
| last_name          | string | null: false, 全角漢字,かな,カナ |
| name_kana          | string | null: false, 全角カナ         |
| birthday           | string | null: false                  |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| product_name       | string     | null: false                    |
| explanation        | text       | null: false                    |
| category           | integer    | null: false                    |
| condition          | integer    | null: false                    |
| shipping_cost      | integer    | null: false                    |
| from               | integer    | null: false                    |
| send               | integer    | null: false                    |
| price              | integer    | null: false, ¥300~¥9999999     |
| user_id            | references | null: false, foreign_key: true |

### Association
- has_many :orders
- belongs_to :user


## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| price              | integer    | null: false, ¥300~¥9999999     |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture         | integer    | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | integer    | null: false                    |
| order_id           | references | null: false, foreign_key: true |

### Association
