class PhotosController < ApplicationController


	def new
		@photo = current_user.photos.build
	end

	def create
		@photo = current_user.photos.build(params[:photo])
		@photo.save!
		redirect_to @photo
	end

	def edit
	end

	def update
	end

	def index
	end

	def show
		@photo = Photo.find(params[:id])
	end

	def destroy
	end




end
