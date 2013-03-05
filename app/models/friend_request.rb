class FriendRequest < ActiveRecord::Base

	belongs_to :requester, :class_name => 'User', :foreign_key => 'requester_id'
	belongs_to :requestee, :class_name => 'User', :foreign_key => 'requestee_id'

	attr_accessible :requester_id, :requestee_id
	validates :requester_id, :requestee_id, :presence => true
	validates_uniqueness_of :requestee_id, :scope => :requester_id
end
