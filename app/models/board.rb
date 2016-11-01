class Board < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :stories, through: :users
end
