# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| first_name     | string | null: false |
| last_name      | string | null: false |
| first_name_kana| string | null: false |
| last_name_kana | string | null: false |
| birth_date     |  date  | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :purchase

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image           | string     | null: false                    |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    | 
| postage_payer   | string     | null: false                    | 
| prefecture_id   | integer    | null: false                    |
| handling_time   | string     | null: false                    |
| price           | string     | null: false                    |
| user            | reference  | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_many :comments
- has_one :purchases

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| comment | text       | null: false                    |

### Association

- belongs_to :users
- belongs_to :items

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :addresses

## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     | null: false                    | 
| phone_number    | string     | null: false                    |
| purchase        | references | null: false, foreign_key: true |


### Association

- belongs_to :purchases
- belongs_to_active_hash :prefecture