class PlayDateSerializer < ActiveModel::Serializer
  has_many :dogs, through: :dog_play_dates
  attributes :id, :location, :date, :time, :dogLimit, :userId, :name

  def dogLimit
    obj.dog_limit
  end

  def userId
    obj.user_id
  end
end
