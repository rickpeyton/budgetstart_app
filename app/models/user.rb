class User < ActiveRecord::Base
  has_many :expenses
  has_many :categories
  has_secure_password validations: false
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :password, on: :create, presence: true, length: { minimum: 6 }
  validates :password, on: :update, allow_blank: true, length: { minimum: 6 }
end
