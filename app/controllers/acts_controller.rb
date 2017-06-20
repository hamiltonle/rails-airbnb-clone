class ActsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @acts = Act.all
  end

  def show
    @act = Act.find(params[:id])
  end

  def new
    @act = Act.new
  end

  def create
    @act = Act.new(act_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def act_params
    params.require(:act).permit(:name, :description, :photo, :photo_cache, :user_id, :genre,
     :good_for)
  end
end
