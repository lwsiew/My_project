class PlacesController < ApplicationController

	def index
		@places = Place.all
	end

	def show
		@place = Place.find(params[:id])
	end

	def new
		@place = Place.new
	end

	def create
		@place = Place.new(new_params)
		if @place.save
		    redirect_to places_path
		else
		    render "new"
		end
	end

	def bookmark		

	 	@place = Place.find(params[:place_id])
	 	if Bookmark.where(place_id: @place.id, user_id: current_user.id).exists?
	 	else
	 		@bookmarked = Bookmark.new(place_id: @place.id, user_id: current_user.id)
	 		if @bookmarked.save
				redirect_to user_path(current_user.id)
			else
				redirect_to root_path
			end
		end
	end
	private 

	def new_params
		params.require(:place).permit(:name, :description, :image)
	end
end
