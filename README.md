# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :medicals
- has_many :exams

## medicals テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| subject | string     | null: false                    |
| user    | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- has_many :exams

## exams テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| title     | string     | null: false                    |
| hospital  | string     | null: false                    |
| exam_date | date       | null: false                    |
| comment   | text       | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :medicals
- has_one_attached :image

