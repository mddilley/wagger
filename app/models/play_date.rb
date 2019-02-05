class PlayDate < ApplicationRecord
  has_many :dog_play_dates
  has_many :dogs, through: :dog_play_dates
end
