class FriendshipsController < ApplicationController

def new 
end

def create
	@friendship = current_user.friendships.build(:friend_id => params[:friend_id])
	if @friendship.save
		@request = FriendRequest.where(:requester_id => params[:friend_id], :requestee_id => current_user.id).first
		@request.destroy
		redirect_to my_friend_requests_path
	else
		flash[:notice] = "Sumtng went wrong. Please try again"
		redirect_to root_path
	end
end

def destroy
end

end
