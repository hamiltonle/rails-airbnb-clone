class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @recommended_acts = Acts.all[0, 1, 2]
  end
end
