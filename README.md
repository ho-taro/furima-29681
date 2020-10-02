# テーブル設計

## users テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| nickname       | string  | null: false |
| email          | string  | null: false |
| password       | string  | null: false |
| last_name      | string  | null: false |
| first_name     | string  | null: false |
| last_furigana  | string  | null: false |
| first_furigana | string  | null: false |
| birthdate      | date    | null: false |

has_many :items
has_many :orders


## items テーブル

| Column            | Type       | Options                        |
| -------------     | ---------- | ------------------------------ |
| products_name     | string     | null: false                    |
| description       | text       | null: false                    |
| category_id       | integer    | null: false                    |
| status_id         | integer    | null: false                    |
| delivery_fee_id   | integer    | null: false                    |
| shipping_place_id | integer    | null: false                    |
| day_to_ship_id    | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |#外部キー

belongs_to :user
has_one :orders
has_one_attached :image           #ActiveStorageとのアソシエーション

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address_book

## address_books テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postcode      | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                | #任意
| mobile        | string     | null: false                    |
| order         | references | null: false, foreign_key: true | #外部キー

belongs_to :orders
