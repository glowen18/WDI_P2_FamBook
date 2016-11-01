class User < ApplicationRecord
  has_secure_password
  has_and_belongs_to_many :boards
  has_many :stories
end
