class PlayDate < ApplicationRecord
  belongs_to :user
  has_many :dog_play_dates
  has_many :dogs, through: :dog_play_dates

  accepts_nested_attributes_for :dog_play_dates

  def format_date
    date.strftime("%B %d, %Y")
  end

  def format_time
    time.strftime("%l:%M %p")
  end

end
