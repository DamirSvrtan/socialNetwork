class LikesController < ApplicationController

	def index
		@photo = Photo.find(params[:photo_id])
		@likes = @photo.likes
	end


	def create
		@like = current_user.likes.build(:photo_id => params[:photo_id])
		@like.save!
		@photo = Photo.find(params[:photo_id])
		redirect_to @photo
	end

	def destroy
		@dislike = Like.where(:photo_id => params[:photo_id], :user_id => current_user.id).first
		@dislike.destroy
		@photo = Photo.find(params[:photo_id])
		redirect_to @photo		
	end
end
