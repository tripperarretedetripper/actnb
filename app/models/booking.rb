class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates :date, presence: true
  validates :user_id, presence: true
  validates :activity_id, presence: true
  validates :total_price, presence: true
  validates :participants_number, presence: true
  validates :status, inclusion: { in: %w[pending accepted declined] }
end
