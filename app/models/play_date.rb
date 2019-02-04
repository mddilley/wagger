class PlayDate < ApplicationRecord
  has_many :dogs
  has_many :users, through: :dogs
end
