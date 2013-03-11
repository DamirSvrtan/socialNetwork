class StaticPagesController < ApplicationController
  def home
	if !signed_in?
		@photos = Photo.where(:public => true)
	else
		@photos =  Photo.where(:public => true) + current_user.private_photos_of_friends + current_user.photos.where(:public => false)
	end
  end
  def my_friend_requests
  end


end
