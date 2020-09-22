# テーブル設計

## users テーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| nickname  | string  | null: false |
| email     | string  | null: false |
| password  | string  | null: false |
| name      | string  | null: false |
| hurigana  | string  | null: false |
| birthdate | integer | null: false |

has_many :items
has_many :address_book


## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | string     | null: false                    |
| products_name | string     | null: false                    |
| description   | string     | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |#外部キー

belongs_to :users
has_one    :address_book

## address_book テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postcode      | integer    | null: false                    |
| prefecture_id | references | null: false                    |
| city          | string     | null: false                    |
| block         | integer    | null: false                    |
| building      | string     |                                | #任意
| mobile        | integer    | null: false                    |
| user          | references | null: false, foreign_key: true | #外部キー

belongs_to :users
belongs_to :items
