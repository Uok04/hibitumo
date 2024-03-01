FactoryBot.define do
  factory :user do
    nickname { "日々積　助久" }
    email { Faker::Internet.email }
    password {"Abc123"}
    password_confirmation { password }
    position { "部長" }
    affiliation { "Webエンジニア" }
  end
end