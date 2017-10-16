class User < ActiveRecord::Base
  has_many :reviews
  has_secure_password

  validates :email, uniqueness: true
  validates :password, confirmation: true
  validates :password, length: { in: 6..20 }
end
