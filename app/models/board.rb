class Board < ApplicationRecord
  has_many :users
  has_many :stories, through: :users
end
