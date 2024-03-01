FactoryBot.define do
  factory :user do
    nickname { "" }
    email { Faker::Internet.email }
    encrypted_password { "Password1" } # 6文字以上で半角英数字混合
    last_name { "山田" } # 全角文字
    first_name { "太郎" } # 全角文字
    last_name_kana { "ヤマダ" } # 全角カタカナ
    first_name_kana { "タロウ" } # 全角カタカナ
    birthday { Date.today }
  end
end