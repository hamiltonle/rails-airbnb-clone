class ActsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    if params[:genre]
      @acts = Act.where(:genre => params[:genre])
    elsif params[:good_for]
      @acts = Act.where(:good_for => params[:good_for])
    else
      @acts = Act.all
    end
  end

  def show
    @act = Act.find(params[:id])
  end

  def new
    # @user = current_user
    @act = Act.new
  end

  def create
    @act = Act.new(act_params)
    @act.user = current_user
    @act.save
    redirect_to dashboard_users_path
  end

  def edit
    @act = Act.find(params[:id])
  end

  def update
    @act = Act.find(params[:id])
    @act = Act.update(act_params)
  end

  def destroy
    @act = Act.find(params[:id])
    @act.delete
  end

  private

  def act_params
    params.require(:act).permit(:name, :description, :photo_cache, :user_id, :genre,
     :good_for, photos: [])
  end
end
