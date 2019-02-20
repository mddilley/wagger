class DogPlayDate < ApplicationRecord
  belongs_to :dog
  belongs_to :play_date

  validate :save_object?

  private

    def save_object?
      if self.class.find_by(:dog_id => self.dog_id, :play_date_id => self.play_date_id)
        errors[:attribute] << "Your dog already joined this playdate!"
        return false
      end
    end


end
