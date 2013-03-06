class Friendship < ActiveRecord::Base

	belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
	belongs_to :friend, :class_name => 'User', :foreign_key => 'friend_id'

	attr_accessible :user_id, :friend_id
	validates :user_id, :friend_id, :presence => true
	validates_uniqueness_of :friend_id, :scope => :user_id




end
