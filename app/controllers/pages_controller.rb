class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @recommended_acts = Act.all.reverse[0..5]
  end
end
