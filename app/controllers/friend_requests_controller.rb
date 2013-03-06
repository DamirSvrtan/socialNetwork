class FriendRequestsController < ApplicationController

	def new
	end

	def create
			@request=current_user.sent_requests.build(:requestee_id => params[:requestee_id])
			@request.save!
			redirect_to User.find(params[:requestee_id])

	end

	def destroy
			@request = FriendRequest.find(params[:id])
			@request.destroy
			redirect_to root_path
	end
end
