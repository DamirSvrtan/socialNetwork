class FriendRequestsController < ApplicationController

	def new
	end

	def create
			@request=FriendRequest.new(params[:friend_request])
			@request.save!
			redirect_to User.find(params[:friend_request][:requestee_id])

	end

	def destroy
			@request = FriendRequest.find(params[:id])
			@request.destroy
			redirect_to root_path
	end
end
