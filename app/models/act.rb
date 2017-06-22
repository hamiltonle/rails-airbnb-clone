class Act < ApplicationRecord
  has_many :bookings
  belongs_to :user

  has_many :bookers, through: :bookings, source: :user

  scope :booked, -> { joins(:bookings).where("bookings.id IS NOT NULL") }
  has_attachments :photos, maximum: 10
end










