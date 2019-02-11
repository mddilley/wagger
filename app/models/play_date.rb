class PlayDate < ApplicationRecord
  has_many :dog_play_dates
  has_many :dogs, through: :dog_play_dates

  def format_date
    date.strftime("%B %d, %Y")
  end

  def format_time
    time.strftime("%I:%M %p")
  end

end
