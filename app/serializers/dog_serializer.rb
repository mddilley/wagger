class DogSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :breed, :weight, :fixed, :user_id, :img, :friendlyRating, :aggressiveRating

  def friendlyRating
    object.friendly_rating
  end

  def aggressiveRating
    object.aggressive_rating
  end

end
