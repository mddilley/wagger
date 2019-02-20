class Dog < ApplicationRecord
  belongs_to :user, optional: true
  has_many :dog_play_dates
  has_many :play_dates, through: :dog_play_dates

  validates :name, presence: true
  validates :age, numericality: true
  validates :sex, presence: true
  validates :weight, numericality: true
  validates :aggressive_rating, numericality: true
  validates :friendly_rating, numericality: true

end
