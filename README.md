# README

# アプリケーション名
HIBITUMO

# アプリケーション概要
日々のタスクを管理し、<br>連携することで効率化することを目的とします。

# URL
http://3.115.204.153/

# テスト用アカウント
- Basic認証パスワード : admin
- Basic認証ID : 2222
- メールアドレス : 
- パスワード : 

# 利用方法
## タスク投稿
1. トップページ（一覧ページ）のヘッダーからユーザー新規登録を行う
2. New Taskボタンから、<br>タスク内容（タスク名・タスク詳細・カテゴリー・期日）を入力して投稿する
3. タスクを完了したら、削除する

## タスクを共有し連携することができる
1. 自分以外のユーザーをクリックすることで、<br>そのユーザーのタスクを見ることができる。
2. タスク詳細に、連絡先と担当者様の名前を記入しておくことで、<br>社外からでも、代わりに資料をメールしておいてもらうということもできる。

# アプリケーションを作成した背景
タスクが増えてくると、覚えきれず忘れてしまうということがあり、その漏れを何とかしたいという気持ちがありました。また、頼まれごとをされた時に、連携がうまく行かずに、対応が困難だったこともあり、突発的なタスクに対して、誰でも対応できるような仕組みがあればと考えていました。タスクを共有することで上司であれば、部下がどれくらいのタスクを抱えているのかを把握することもできます。タスクを共有することで効率化と連携を高めたいと思いました。

# 洗い出した要件

# 実装した機能についての画像やGIFおよびその説明

# 実装予定の機能
タスク管理機能が完了したのち、アプリ内からタスクをユーザー同士で受け渡しができるような機能を実装したいと考えています。
その延長線上で、自動マニュアル作成機能を実装したいと考えております。

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/99a3545227420b8391242faa579b5dd9.png)](https://gyazo.com/99a3545227420b8391242faa579b5dd9)

# 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/4281b7a4ac1f779f01552a2a37bd048e.png)](https://gyazo.com/4281b7a4ac1f779f01552a2a37bd048e)

# 開発環境

# ローカルでの操作方法

# 工夫したポイント
現在、構想段階ですが、タスクの期日が迫ってくるとタスクの色が変化し、一目で期日が迫っているタスクを把握することができる機能を実装したいと考えています。

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
