FactoryBot.define do
  factory :user do
    nickname { "日々積　助久" }
    email { Faker::Internet.email }
    encrypted_password { "Password1" } # 6文字以上で半角英数字混合
    position { "部長" }
    affiliation { "Webエンジニア" }
  end
end