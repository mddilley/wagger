class Dog < ApplicationRecord
  belongs_to :user, optional: true
  has_many :dog_play_dates
  has_many :play_dates, through: :dog_play_dates

  validates :name, presence: true
  validates :sex, presence: true

  def fixed_to_string
    fixed ? "Yes" : "No"
  end
end
