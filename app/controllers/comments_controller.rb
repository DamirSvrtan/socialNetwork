class CommentsController < ApplicationController

def create
	@photo = Photo.find(params[:photo_id])
	@comment = @photo.comments.new(:user_id => current_user.id, :text => params[:comment][:text])
	if @comment.save
		redirect_to @photo
	else 
		render :template => 'photos/show'
	end
end


def destroy
end

end
