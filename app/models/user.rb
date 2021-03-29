class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :products
    has_many :buy_products

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

    with_options presence: true do
      validates :nickname
      validates :email
      validates :lastname_kanji, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'に全角文字を使用してください'}
      validates :firstname_kanji, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'に全角文字を使用してください' }
      validates :lastname_katakana, format: { with: /\A[ァ-ヶ]+\z/, message: 'に全角カタカナを使用してください' }
      validates :firstname_katakana, format: { with: /\A[ァ-ヶ]+\z/, message: 'に全角カタカナを使用してください' }
      validates :birthday
    end

  end