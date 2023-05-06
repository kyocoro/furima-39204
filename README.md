# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| name     | string | null: false |
| date     | string | null: false |


### Association

- has_many :items
- has_many :purchases
- has_many :comments

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| image       | string     | null: false                    |
| name        | string     | null: false                    |
| explanation | string     | null: false                    |
| category    | string     | null: false                    |
| condition   | string     | null: false                    |
| charge      | string     | null: false                    |
| region      | string     | null: false                    |
| days        | string     | null: false                    |
| price       | string     | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- has_one :purchase
- belongs_to :user
- has_many :comments

## purchases テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postcode       | string     | null: false                    |
| prefectures    | string     | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| buildingname   | string     |                                |
| telephone      | string     | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :item

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user
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
