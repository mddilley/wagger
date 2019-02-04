class User < ApplicationRecord
  has_secure_password

  has_many :dogs
  has_many :play_dates, through: :dogs
end
