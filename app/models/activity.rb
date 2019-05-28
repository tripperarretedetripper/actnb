class Activity < ApplicationRecord
  belongs_to :seller, class_name: 'User'
  has_many :bookings

  validates :name, :address, :type_activity, :price, :description, presence: true
  validates :max_participants, :seller, presence: true
  validates :price, :max_participants, numericality: { only_integer: true }
end
