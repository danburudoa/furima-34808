# README

## users テーブル

| Column       　　　　| Type   | Options     |
| --------     　　　　| ------ | ----------- |
| nickname     　　　　| string | null: false |
| email        　　　　| string | unique: true , null: false|
| encrypted_password  | string | null: false |
| lastname_kanji   　 | string | null: false |
| firstname_kanji　　　| string | null: false |
| lastname_katakana  　| string | null: false |
| firstname_katakana　| string | null: false |
| birthday     　　　　| date   | null: false |

### Association

- has_many :products
- has_many :buy_products

## products テーブル

| Column      | Type         | Options     |
| ------      | ------       | ----------- |
| name        | string       | null: false |
| describe    | text         | null: false |
| category_id | integer      | null: false |
| condition_id| integer      | null: false |
| charge_id   | integer      | null: false |
| delivery_id | integer      | null: false |
| area_id     | integer      | null: false |
| price       | integer      | null: false |
| user        | references   | foreign_key: true  |

### Association

- belongs_to :user
- has_one :buy_product

## buy_products テーブル

| Column         | Type       | Options     |
| ------         | ---------- | ----------- |
| user           | references | foreign_key: true |
| product        | references | foreign_key: true |
 
### Association

- belongs_to :user
- belongs_to :product
- has_one :ship

## ship テーブル

| Column       　| Type   | Options     |
| --------     　| ------ | ----------- |
| postal_code    | string     | null: false |
| area_id  | integer    | null: false |
| municipalities | string     | null: false |
| address        | string     | null: false |
| building       | string     |             |
| phone_number   | string     | null: false |
| buy_product    | references | foreign_key: true |

### Association

- belongs_to :buy_product
