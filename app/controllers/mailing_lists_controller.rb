class MailingListsController < ApplicationController

def new
  @mail = MailingList.new
end

def create
	@mail = MailingList.new(params[:mailing_list])
	@mail.save!
	render :nothing => true
end

end
