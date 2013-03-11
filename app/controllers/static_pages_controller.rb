class StaticPagesController < ApplicationController
  def home
	if !signed_in?
		@photos = Photo.where(:public => true)
	else
		@photos = Photo.find_each(:batch_size => 5000) do |photo|
			photo.id > 1
		end
	end
  end
  def my_friend_requests
  end


end
