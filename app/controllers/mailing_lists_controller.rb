class MailingListsController < ApplicationController

def new
  @mail = MailingList.new
end

def create
	@mail = MailingList.new(params[:mailing_list])
	@mail.save
	respond_to do |format|
		format.js
	end
end

def email_exists
	@mail = MailingList.find_by_email(params[:email])
	respond_to do |format|
		format.json { render :json => @mail}
	end
end

end
