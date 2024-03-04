class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :tasks

  validates :nickname, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  validates :position, presence: true
  validates :affiliation, presence: true

  # 商品画像が必須であることを検証
  validate :validate_avatar_presence

  def validate_avatar_presence
    errors.add(:avatar, 'を添付してください') unless avatar.attached?
  end

end

