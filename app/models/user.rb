class User < ApplicationRecord
  has_secure_password

  validates :name, :created, :password_digest, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
end
