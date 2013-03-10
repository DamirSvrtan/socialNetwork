class PhotosController < ApplicationController


	def new
		@photo = Photo.new
	end

	def create
		@photo = Photo.new(params[:photo])
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
