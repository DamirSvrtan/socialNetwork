module FriendRequestsHelper

	def friend_request_pending?(user)
		FriendRequest.where( :requester_id => current_user.id, :requestee_id => user.id).exists? 
	end
	
	def have_to_respond_to_friend_request(user)
		FriendRequest.where( :requester_id => user.id, :requestee_id => current_user.id).exists?
	end

end
