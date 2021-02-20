# テーブル設計

## users テーブル

| Column                | Type    | Options                    |
| --------------------  | ------- | -------------------------- |
| first_name            | string  | null: false                |
| last_name             | string  | null: false                |
| first_name_kana       | string  | null: false                |
| last_name_kana        | string  | null: false                |
| nickname              | string  | null: false                |
| email                 | string  | null: false, unique: false |
| encrypted_password    | string  | null: false                |
| birthday              | date    | null: false                |



### Association

- has_many :items
- has_many :orders
- has_one :address
- has_one :card

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | -----------| ------------------------------ |
| image            | string     | null: false                    |
| name             | string     | null: false                    |
| size             | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| price            | integer    | null: false                    |
| detail           | text       | null: false                    |
| condition_id     | integer    | null: false                    |
| delivery_day_id  | integer    | null: false, foreign_key: true |
| delivery_area_id | integer    | null: false, foreign_key: true |
| delivery_bear_id | integer    | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | -----------| ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | string     | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address
- belongs_to :card

# addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | -------------------------------|
| zip_code      | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address1      | string     | null: false                    |
| address2      | string     | null: false                    |
| phone         | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :order
- belongs_to :user



# cards テーブル

| Column        | Type       | Options                        |
| card_num      | integer    | null: false                    |
| validity_y    | integer    | null: false                    |
| validity_m    | integer    | null: false                    |
| security_code | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :order
- belongs_to :user