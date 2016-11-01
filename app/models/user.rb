class User < ApplicationRecord
  has_secure_password
  has_many :boards
  has_many :stories, through: :boards
end
