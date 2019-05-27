class Activity < ApplicationRecord
  belongs_to :seller, class_name: 'User'
  has_many :bookings
end
