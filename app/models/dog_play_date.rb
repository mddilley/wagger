class DogPlayDate < ApplicationRecord
  belongs_to :dog, optional: true
  belongs_to :play_date, optional: true

end
