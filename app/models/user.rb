class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  PASSWORD_CODE_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i.freeze
  NAME_CODE_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  FURIGANA_CODE_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: PASSWORD_CODE_REGEX, message: 'Password Include both letters and numbers' }
    validates :last_name, format: { with: NAME_CODE_REGEX, message: 'Full-width characters' }
    validates :first_name, format: { with: NAME_CODE_REGEX, message: 'Full-width characters' }
    validates :last_furigana, format: { with: FURIGANA_CODE_REGEX, message: 'Full-width katakana characters' }
    validates :first_furigana, format: { with: FURIGANA_CODE_REGEX, message: 'Full-width katakana characters' }
    validates :birthdate
  end
end
