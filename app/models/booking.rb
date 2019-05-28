class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  belongs_to :seller, class_name: 'User', through: :activities
  validates :date, presence: true
  validates :user, presence: true
  validates :activity, presence: true
  validates :total_price, presence: true
  validates :participants_number, presence: true
  validates :status, inclusion: { in: %w[pending accepted declined] }
end
