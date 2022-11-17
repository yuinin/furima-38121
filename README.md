# テーブル設計

## users テーブル

| Column             | Type   | Options                      |
| ------------------ | ------ | ---------------------------- |
| nickname           | string | null: false,                 |
| email              | string | null: false, unique: true    |
| encrypted_password | string | null: false,                 |
| first_name         | string | null: false, 全角漢字,かな,カナ |
| last_name          | string | null: false, 全角漢字,かな,カナ |
| first_name_kana    | string | null: false, 全角カナ         |
| last_name_kana     | string | null: false, 全角カナ         |
| birthday           | date   | null: false                  |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| product_name       | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping_cost_id   | integer    | null: false                    |
| from_id            | integer    | null: false                    |
| scheduled_delivery_id | integer    | null: false                    |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association
- has_one :order
- belongs_to :user


## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
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
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| order_id           | references | null: false, foreign_key: true |

### Association
- belongs_to :order