class PlayDate < ApplicationRecord
  belongs_to :user
  has_many :dog_play_dates
  has_many :dogs, through: :dog_play_dates

  accepts_nested_attributes_for :dog_play_dates

  validates :name, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :dog_limit, presence: true
  validates :dog_limit, numericality: true

  def format_date
    date.strftime("%B %d, %Y")
  end

  def format_time
    time.strftime("%l:%M %p")
  end

  def self.last_five
    order("created_at desc").limit(5)
  end

end
