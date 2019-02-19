class Dog < ApplicationRecord
  belongs_to :user, optional: true
  has_many :dog_play_dates
  has_many :play_dates, through: :dog_play_dates

  validates :age, numericality: true, :if => :age
  validates :weight, numericality: true, :if => :weight
  validates :aggressive_rating, numericality: true, :if => :aggressive_rating
  validates :friendly_rating, numericality: true, :if => :friendly_rating

  def fixed_to_string
    fixed ? "Yes" : "No"
  end
end
