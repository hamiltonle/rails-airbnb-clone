class Act < ApplicationRecord
  has_many :bookings
  has_attachments :photos, maximum: 10
end
