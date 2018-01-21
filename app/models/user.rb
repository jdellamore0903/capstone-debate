class User < ApplicationRecord
  require 'bcrypt'
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :email, uniqueness: true

end
