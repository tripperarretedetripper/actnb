class Activity < ApplicationRecord
  belongs_to :seller, class_name: 'User', dependence: :destroy
  has_many :bookings

  validates :name, :address, :type, :price, :description, presence: true
  validates :nb_participants, :start_date, :end_date, :seller, presence: true
  validates :price, :nb_participants, numericality: { only_integer: true }
end
