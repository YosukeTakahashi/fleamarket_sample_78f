# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| postal_code      | integer    | null: false                    |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| room_number      | string     | null: false                    |
| telephone_number | integer    | null: false                    |

### Association

- belongs_to :user

## cards テーブル

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| user_id     | references | null: false, foreign_key:true |
| customer_id | string     | null: false                   |
| card_id     | string     | null: false                   |

### Association

- belongs_to :user

## Images テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    |
| product_id | references | null: false, foreign_key: true |

### Association-

belongs_to :product

## Categories テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| ancestry | string | null: false |

### Association-

has_one :product

## Users テーブル

| Column       | Type   | Options                  |
| ------------ | ------ | ------------------------ |
| first_name   | string | null: false              |
| family_name  | string | null: false              |
| first_kana   | string | null: false              |
| family_kana  | string | null: false              |
| nickname     | string | null: false,unique: true |
| mail_address | string | null: false,unique: true |
| birthday     | date   | null: false              |

### Association

- belongs_to :cards
- has_one :address
- has_many :products

## Products テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| text               | text       | null: false                    |
| price              | integer    | null: false                    |
| condition          | string     | null: false                    |
| area               | string     | null: false                    |
| postage            | string     | null: false                    |
| days               | string     | null: false                    |
| credit_information | string     | null: false                    |
| seller_id          | references | null: false, foreign_key: true |
| buyer_id           | references | foreign_key: true              |
| category_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :images
- belongs_to :category
