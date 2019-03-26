class PlayDateSerializer < ActiveModel::Serializer
  has_many :dogs
  attributes :id, :location, :date, :time, :dogLimit, :userId, :name, :playDates

  def dogLimit
    object.dog_limit
  end

  def userId
    object.user_id
  end

  def playDates
    dogPlayDates = []
    object.dog_play_dates.each do |d|
      dogPlayDate = {}
      dogPlayDate["dog"] = Dog.find(d.dog_id).name
      dogPlayDate["userId"] = Dog.find(d.dog_id).user_id
      dogPlayDate["dogId"] = Dog.find(d.dog_id).id
      dogPlayDate["note"] = d.note
      dogPlayDates << dogPlayDate
    end
    dogPlayDates
  end

end
