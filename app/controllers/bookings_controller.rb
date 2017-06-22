class BookingsController < ApplicationController

  # Don't think we need index action, unless it's with a where parameter for the user_id
  def index
    # @bookings = Bookings.all
  end

  def show
    # will need to find booking of a particular user...@booking.user_id? & @booking.act_id?
    @booking = Booking.find(params[:id])
  end

  def new
    @act = Act.find(params[:act_id])
    @booking = Booking.new
  end

  def create
    @act = Act.find(params[:act_id])
    @booking = Booking.new(bookings_param)
    @booking.user = current_user
    @booking.save
    redirect_to act_path(@act.id)
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.update(booking_params)
    @booking.save
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.delete
  end

  private

  def bookings_param
    params.require(:booking).permit(:time, :address, :booking_status, :user_id, :act_id)
  end
end

