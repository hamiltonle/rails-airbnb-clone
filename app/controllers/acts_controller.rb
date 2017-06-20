class ActsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
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
    @act = Act.new
  end

  #def good_for(event_type)
  # @acts = Act.where(good_for: event_type)
  #end

  #def genre(genre_type)
  #  @acts = Act.where(genre: genre_type)
  #end

  def create
    @act = Act.new(act_params)
    @act.save
    redirect_to acts_path
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
    @act.destroy
  end

  private

  def act_params
    params.require(:act).permit(:name, :description, :photo, :photo_cache, :user_id, :genre,
     :good_for)
  end
end
