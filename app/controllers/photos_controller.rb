class PhotosController < ApplicationController


	def new
		@photo = current_user.photos.build
	end

	def create
		@photo = current_user.photos.build(params[:photo])
		if @photo.save
			redirect_to @photo
		else 
			render 'new'
		end
	end

	def edit
	end

	def update
	end

	def index
	end

	def show
		@photo = Photo.find(params[:id])
		@user = @photo.owner
		@comment = Comment.new
		redirect_to root_path if !signed_in? && @photo.public == false

		if signed_in?
			redirect_to root_path unless @photo.photo_viewable_by?(current_user) 
		end

	end

	def destroy
	end




end
