class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  belongs_to :seller, class_name: 'User', through: :activities
end
