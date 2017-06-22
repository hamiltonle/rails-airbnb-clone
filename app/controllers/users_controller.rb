class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to act_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    redirect_to dashboard_users_path
  end

  def dashboard
    @gigs = current_user.gigs
    @bookings = current_user.bookings
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :bio, :photo)
  end
end
