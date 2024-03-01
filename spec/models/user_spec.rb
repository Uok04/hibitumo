require 'rails_helper'

RSpec.describe User, type: :model do
  before do

  end
end 

describe 'ユーザー新規登録' do
  context '新規登録できる場合' do
    it 'nicknameとpositionとaffiliationとpasswordとpassword_confirmationが存在すれば登録できる' do
      @user = FactoryBot.build(:user)
      expect(@user).to be_valid
    end
  end

  context '新規登録できない場合' do
    it 'nicknameが空では登録できない' do
      @user = FactoryBot.build(:user)
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user = FactoryBot.build(:user)
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user = FactoryBot.build(:user)
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user = FactoryBot.build(:user)
      @user.password = "123456"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password には英字と数字の両方を含めて設定してください")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user = FactoryBot.build(:user)
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'emailは@を含まないと登録できない' do
      @user = FactoryBot.build(:user)
      @user.email = "testmail"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'passwordが数字だけでは登録できない' do
      @user = FactoryBot.build(:user)
      @user.password = "88888888"
      @user.password_confirmation = "88888888"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    it 'passwordが英語だけでは登録できない' do
      @user = FactoryBot.build(:user)
      @user.password = "aaaaaaaa"
      @user.password_confirmation = "aaaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    it 'passwordが5文字以下では登録できない' do
      @user = FactoryBot.build(:user)
      @user.password = "123ab"
      @user.password_confirmation = "123ab"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordが129文字以上では登録できない' do
      @user = FactoryBot.build(:user)
      @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
    end
    it '全角文字を含むpasswordでは登録できない' do
      @user = FactoryBot.build(:user)
      @user.password = "test試験"
      @user.password_confirmation = "test試験"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    it 'positionが空では登録できない' do
      @user = FactoryBot.build(:user)
      @user.position = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Position can't be blank")
    end
    it 'affiliationが空では登録できない' do
      @user = FactoryBot.build(:user)
      @user.affiliation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Affiliation can't be blank")
    end
  end
end

