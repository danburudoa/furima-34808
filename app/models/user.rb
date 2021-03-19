class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
    with_options presence: true
      validates :nickname, presence: true
      validates :email, presence: true 
      PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
      validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
      validates :lastname_kanji, presence: true,format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'に全角文字を使用してください'}
      validates :firstname_kanji, presence: true,format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'に全角文字を使用してください' }
      validates :lastname_katakana, presence: true,format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'に全角文字を使用してください' }
      validates :firstname_katakana, presence: true,format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'に全角文字を使用してください' }
      validates :birthday, presence: true
  　end
end
