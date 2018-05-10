class WelcomeController < ApplicationController
  def index
  	@place = Place.last
  	@review = @place.reviews
  end
end
