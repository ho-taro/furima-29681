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
has_many :settlements


## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| products_name | string     | null: false                    |
| description   | string     | null: false                    |
| category      | integer    | null: false                    |
| status        | integer    | null: false                    |
| delivery_fee  | integer    | null: false                    |
| shipping_place | integer    | null: false                    |
| day_to_ship   | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |#外部キー

belongs_to :user
has_many :settlements
has_one_attached :image           #ActiveStorageとのアソシエーション

## settlements テーブル

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
| prefecture_id | text       | null: false                    |
| city          | integer    | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                | #任意
| mobile        | string     | null: false                    |
| user          | references | null: false, foreign_key: true | #外部キー

belongs_to :settlement
