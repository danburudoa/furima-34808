# README

## users テーブル

| Column       　　　　| Type   | Options     |
| --------     　　　　| ------ | ----------- |
| name         　　　　| string | null: false |
| email        　　　　| string | unique:true |
| encrypted_password  | string | null: false |
| lastname_kanji   　 | string | null: false |
| firstname_kanji　　　| string | null: false |
| lastname_katakana  　| string | null: false |
| firstname_katakana　| string | null: false |
| birthday     　　　　| date   | null: false |

### Association

- has_many :products
- has_many :buy_product

## products テーブル

| Column      | Type         | Options     |
| ------      | ------       | ----------- |
| name        | string       | null: false |
| describe    | text         | null: false |
| category_id | integer      | null: false |
| condition_id| integer      | null: false |
| charge_id   | integer      | null: false |
| days_id     | integer      | null: false |
| area_id     | integer      | null: false |
| price       | string       | null: false |
| user        | references   | foreign_key: true  |

### Association

- belongs_to :user
- has_one :buy_product

## buy_products テーブル

| Column         | Type       | Options     |
| ------         | ---------- | ----------- |
| credit_number  | string     | null: false |
| credit_deadline| date       | null: false |
| security_code  | string     | null: false |
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
| prefecture_id  | integer    | null: false |
| municipalities | string     | null: false |
| address        | string     | null: false |
| building       | string     | null: false |
| phone_number   | string     | null: false |
| buy_product    | references | foreign_key: true |

### Association

- belongs_to :buy_product
