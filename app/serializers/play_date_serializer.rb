class PlayDateSerializer < ActiveModel::Serializer
  has_many :dogs, through: :dog_play_dates
  attributes :id, :location, :date, :time, :dogLimit, :userId, :name

  def dogLimit
    object.dog_limit
  end

  def userId
    object.user_id
  end
end
