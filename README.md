# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# DB 設計

## users table

| Column             | Type                   | Options                 |
|--------------------|------------------------|-------------------------|
| nickname           | string                 | null: false             |
| email              | string                 | unique: true            |
| encrypted_password | string                 | null: false             |
| surname            | string                 | null: false             |
| name               | string                 | null: false             |
| kana_surname       | string                 | null: false             |
| kana_name          | string                 | null: false             |
| birthday           | date                   | null: false             |

### Association

* has_many :products
* has_many :deal_records

## products table

| Column             | Type                   | Options                 |
|--------------------|------------------------|-------------------------|
| title              | string                 | null: false             |
| explanation        | text                   | null: false             |
| category_id        | integer                | null: false             |
| status_id          | integer                | null: false             |
| shipping_fee_id    | integer                | null: false             |
| state_id           | integer                | null: false             |
| shipping_date_id   | integer                | null: false             |
| price              | integer                | null: false             |
| user               | references             | foreign_key: true       |

### Association

- belongs_to :user
- has_one :deal_record

## deal_records table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| user        | references | foreign_key: true |
| product     | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :shipment

## shipments table

| Column             | Type                   | Options                 |
|--------------------|------------------------|-------------------------|
| zip_code           | string                 | null: false             |
| state_id           | string                 | null: false             |
| city               | string                 | null: false             |
| street             | string                 | null: false             |
| apartment          | string                 |                         |
| telephone          | string                 | null: false             |
| deal_record        | references             | foreign_key: true       |

### Association

- belongs_to :deal_record