class Comment < ActiveRecord::Base
	attr_accessible :text, :user_id, :photo_id
	belongs_to :user
	belongs_to :photo
	validates :text, :presence => true
end
