class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bookings
  has_many :acts, through: :bookings
  has_many :gigs, class_name: "Act"

  # has_many :act_bookings, foreign_key: "user_id", class_name: "Act"
  has_attachment :photo
end

