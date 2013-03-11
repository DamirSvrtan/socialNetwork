class LikesController < ApplicationController

	def create
		@like = current_user.likes.build(:photo_id => params[:photo_id])
		@like.save!
		@photo = Photo.find(params[:photo_id])
		redirect_to @photo
	end

	def destroy
		@dislike = Like.where(:photo_id => params[:photo_id], :user_id => params[:user_id]).first
		@dislike.destroy
		@photo = Photo.find(params[:photo_id])
		redirect_to @photo		
	end
end
