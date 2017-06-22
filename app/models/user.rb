class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bookings

  #other performers you are booking
  has_many :hosted_gigs, through: :bookings

  #acts you are offering
  has_many :acts

  #acts you are booked to perform
  def performing_gigs
    acts.booked
  end

  # has_many :act_bookings, foreign_key: "user_id", class_name: "Act"
  has_attachment :photo
end

