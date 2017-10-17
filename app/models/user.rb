class User < ActiveRecord::Base
  has_many :reviews
  has_secure_password

  class << self
  def authenticate_with_credentials(email, password)
    email.downcase!
    user = User.where("replace(email, ' ', '') = replace(?, ' ', '')", "#{email}").first
    if user && user.authenticate(password)
      return user
    end
  end
end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :password, confirmation: true, length: { in: 6..20 }
end
