# テーブル設計

## users テーブル

| Column                | Type    | Options     |
| --------------------  | ------- | ----------- |
| first_name            | string  | null: false |
| last_name             | string  | null: false |
| first_name_kana       | string  | null: false |
| last_name_kana        | string  | null: false |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| birth_y               | integer | null: false |
| birth_m               | integer | null: false |
| birth_d               | integer | null: false |
| phone                 | integer | null: false |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type       | Options                        |
| ------------- | -----------| ------------------------------ |
| image         | string     | null: false                    |
| name          | string     | null: false                    |
| size          | integer    | null: false                    |
| category      | string     | null: false                    |
| price         | integer    | null: false                    |
| detail        | text       | null: false                    |
| condition     | string     | null: false                    |
| delivery_days | string     | null: false, foreign_key: true |
| delivery_area | string     | null: false, foreign_key: true |
| delivery_bear | string     | null: false, foreign_key: true |
| user-id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## delivery テーブル

| Column        | Type       | Options       |
| ------------- | ---------- | --------------|
| delivery_days | string     | null: false   |
| delivery_bear | string     | null: false   |
| delivery_area | string     | null: false   |

### Association

- has_many :items

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | -----------| ------------------------------ |
| users_id      | string     | null: false, foreign_key: true |
| items_id      | string     | null: false, foreign_key: true |
| card_num      | integer    | null: false                    |
| validity_y    | integer    | null: false                    |
| validity_m    | integer    | null: false                    |
| security_code | integer    | null: false                    |
| zip_code      | integer    | null: false                    |
| prefecture    | string     | null: false, foreign_key: true |
| city          | string     | null: false                    |
| address1      | string     | null: false                    |
| address2      | string     | null: false                    |
| phone         | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address

# address テーブル

| Column        | Type       | Options       |
| ------------- | ---------- | --------------|
| prefecture    | string     | null: false   |


### Association

- has_many :orders