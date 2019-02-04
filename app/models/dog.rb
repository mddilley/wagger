class Dog < ApplicationRecord
  belongs_to :play_date, optional: true
  belongs_to :user, optional: true

  def fixed_to_string
    fixed ? "Yes" : "No"
  end
end
