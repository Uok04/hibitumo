class Task < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  belongs_to :user

  #空の投稿を保存できないようにする
  validates :task_name, presence: true
  validates :description, presence: true
  validates :deadline, presence: true

  #ジャンルの選択が「---」の時は保存できないようにする
  validetes :category_id, numericality: { other_than: 1 ,message: "can't be blank"}

end
