class DogSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :breed, :weight, :fixed, :userId, :img, :friendlyRating, :aggressiveRating, :sex

  def friendlyRating
    object.friendly_rating
  end

  def aggressiveRating
    object.aggressive_rating
  end

  def userId
    object.user_id
  end

end
