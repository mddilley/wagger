class Dog < ApplicationRecord
  belongs_to :user, optional: true
  has_many :dog_play_dates
  has_many :play_dates, through: :dog_play_dates

  def fixed_to_string
    fixed ? "Yes" : "No"
  end
end
