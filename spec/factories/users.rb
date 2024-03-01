FactoryBot.define do
  factory :user do
    nickname { "日々積　助久" }
    email { Faker::Internet.email }
    password {"Abc123"}
    password_confirmation { password }
    position { "部長" }
    affiliation { "Webエンジニア" }
    # association :user # ユーザーとの関連付け（適切な関連名に変更する）

    after(:build) do |user|
      user.avatar.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end