FactoryBot.define do
  factory :task do
    association :user
    task_name { "タスク" }
    description { "割引" }
    category_id { "2" }
    deadline { Date.today }
  end
end
