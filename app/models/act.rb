class Act < ApplicationRecord
  has_many :bookings
  belongs_to :user

  has_attachments :photos, maximum: 10
end










