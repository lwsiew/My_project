class PlacesController < ApplicationController
	before_action :check_user
	before_action :check_admin

	def index
		@places = Place.all.paginate(:page => params[:page], :per_page =>2)
	end

	def show
		@place = Place.find(params[:id])
		@review = Review.new
		@show_review = Review.where(place_id: @place.id)
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

	def destroy
		@place = Place.find(params[place.id])
		@place.destroy	
		redirect_to admin_index_path
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

	def review

	 	@user = current_user
	 	@place = Place.find(params[:place_id])
	 	@review = Review.new(review_params)
	 	@review.user_id = current_user.id
	 	@review.place_id =@place.id
	 		if @review.save
				redirect_to user_path(current_user.id)
			else
				redirect_to root_path
			end
	end

	def search
		@places = Place.all
		if params[:search]
		  @places = Place.search(params[:search]).order("created_at DESC")
		else
		@places = Place.all.order("created_at DESC")
		end	
	end

	private 

	def new_params
		params.require(:place).permit(:name, :description, :image, :address, :latitude, :longtitude)
	end

	def review_params
		params.require(:review).permit(:place_id, :user_id, :description)
	end

	def check_user
		if !current_user
			flash[:notice] = "Sorry, please sign in to continue!"
			redirect_to sign_in_path
		end 
	end

	def check_admin
		if current_user.admin
			redirect_to admin_index_path
		end
	end
end
