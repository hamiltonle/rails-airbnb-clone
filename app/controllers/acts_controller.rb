class ActsController < ApplicationController
  def index
    @acts = Acts.all
  end

  def show
    @act = Act.find(params[:id])
  end

  def new
    @act = Act.new
  end

  def create
    @act = Act.new
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
