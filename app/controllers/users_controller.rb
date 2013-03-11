class UsersController < ApplicationController

  def show
	@user=User.find(params[:id])
	@friendrequest = FriendRequest.new()
	if signed_in?
		@photos = current_user.photos_on_profile_page(@user)
	else
		@photos = @user.photos.where(:public => true)
	end
  end

  def new
	@user=User.new
  end

  def create
	@user=User.new(params[:user])
	if @user.save
		sign_in @user
		redirect_to @user
	else 
		render 'new'
	end
  end

  def index
	@users = User.all
  end


  def mutual_friends
	@user = User.find(params[:id])
	@mutual_friends = current_user.mutual_friends_with(@user)
  end

  def friends
	@user = User.find(params[:id])
  end
end
