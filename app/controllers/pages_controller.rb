class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @recommended_acts = Act.all[0..2]
  end
end
