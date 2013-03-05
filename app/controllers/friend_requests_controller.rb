class FriendRequestsController < ApplicationController

	def new
	end

	def create
			@request=FriendRequest.new(:requester_id => current_user.id, :requestee_id => params[:friend_request][:requestee_id])
			@request.save!
			redirect_to User.find(params[:friend_request][:requestee_id])

	end

	def destroy
	end
end
