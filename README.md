<<<<<<< Updated upstream
# テーブル設計
=======
<<<<<<< Updated upstream
# README
=======
<<<<<<< Updated upstream
# テーブル設計
>>>>>>> Stashed changes
>>>>>>> Stashed changes

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
- has_many :purchases

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    | 
| shipping_burden_id | integer    | null: false                    | 
| prefecture_id      | integer    | null: false                    |
| handling_time_id   | integer    | null: false                    |
| price              | iteger     | null: false                    |
| user               | reference  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase
- has_one_attached :image
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :handling_time
- belongs_to_active_hash :shipping_burden

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     |                                | 
| phone_number    | string     | null: false                    |
| purchase        | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase
- belongs_to_active_hash :prefecture

<<<<<<< Updated upstream
=======
<<<<<<< Updated upstream
* ...
=======
=======
>>>>>>> Stashed changes
>>>>>>> Stashed changes
>>>>>>> Stashed changes
