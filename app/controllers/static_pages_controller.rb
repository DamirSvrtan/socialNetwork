class StaticPagesController < ApplicationController
  def home
	if !signed_in?
		@photos = Photo.where(:public => true)
	else
		@photos =  Photo.where(:public => true) + current_user.private_photos_of_friends + current_user.photos.where(:public => false)
	end
        render 'home'
  end

  def my_friend_requests
		if signed_in? 
			home
end
  end


  def blabla
@photos = Photo.where(:public => true)
render 'home'
  end
end
