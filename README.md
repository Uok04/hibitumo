# README

## users テーブル

| Column             | Type    | Options                   |
|--------------------|---------|---------------------------|
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |

### Association
- has_many :tasks

## tasks テーブル

| Column                 | Type        | Options                        |
|------------------------|-------------|--------------------------------|
| user                   | references  | null: false, foreign_key: true |
| task_name              | string      | null: false                    |
| description            | text        | null: false                    |
| category_id            | integer     | null: false                    |
| deadline               | date        | null: false                    |

### Association
- belongs_to :user