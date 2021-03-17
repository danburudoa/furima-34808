# README

## users テーブル

| Column       | Type   | Options     |
| --------     | ------ | ----------- |
| name         | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
| name_kanji   | string | null: false |
| name_katakana| string | null: false |
| birthday     | date   | null: false |

### Association

- has_many :products
- has_one  :buy_product

## products テーブル

| Column   | Type         | Options     |
| ------   | ------       | ----------- |
| image    | ActiveStorage| null:false　|
| name     | string       | null: false |
| describe | text         | null: false |
| category | ActiveHash   | null: false |
| condition| ActiveHash   | null: false |
| charge   | ActiveHash   | null: false |
| days     | ActiveHash   | null: false |
| area     | ActiveHash   | null: false |
| price    | string       | null: false |
| user     | references                 |

### Association

- belongs_to :user
- has_one :buy_product

## buy_products テーブル

| Column         | Type       | Options     |
| ------         | ---------- | ----------- |
| credit_number  | string     | null: false |
| credit_deadline| date       | null: false |
| security_code  | string     | null: false |
| postal_code    | string     | null: false |
| prefecture     | ActiveHash | null: false |
| municipalities | string     | null: false |
| address        | string     | null: false |
| building       | string     | null: false |
| phone_number   | string     | null: false |
| user           | references               |
| product        | references               |
 
### Association

- belongs_to :user
- belongs_to :product

