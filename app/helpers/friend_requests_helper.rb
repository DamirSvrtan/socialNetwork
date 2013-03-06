module FriendRequestsHelper

	def friend_request_pending?(user)
		FriendRequest.where( :requester_id => current_user.id, :requestee_id => user.id).exists? 
	end
	
	def have_to_respond_to_friend_request(user)
		FriendRequest.where( :requester_id => user.id, :requestee_id => current_user.id).exists?
	end

	def friends?(user)
		Friendship.where( :user_id => user.id, :friend_id => current_user.id).exists? || Friendship.where( :user_id => current_user.id, :friend_id => user.id).exists?
	end

	def relationship_with(user)
		if friend_request_pending?(user)
			return '<span class="label label-warning" style="position:relative;font-size:12px;top:20px;height:20px;">Pending friend request</span>'
		elsif have_to_respond_to_friend_request(user)
			return '<span class="label label-important" style="position:relative;font-size:12px;top:20px;height:20px;">Respond to friend request</span>'
		elsif friends?(user)
			return '<span class="label label-success" style="position:relative;font-size:12px;top:20px;height:20px;">Friends</span>'
		else 
			return '<form action="/friend_requests?requestee_id=%s" class="button_to" method="post"><div><input class="btn btn-large btn-primary" id="add_friend_on_show_page" type="submit" value="Add Friend"><input name="authenticity_token" type="hidden" value="w8AgafyAAhwLp/ihL/no0hv1egFLvKVECRexaTJ71dQ="></div></form>' % user.id
		end
	end



end
