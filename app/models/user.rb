class User < ApplicationRecord
  has_secure_password

  validates :name, :created, :password_digest, presence: true
  validates :email, uniqueness: true
end
