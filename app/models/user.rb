class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation
	has_secure_password
	before_save { |user| user.email = email.downcase }
	before_save :create_remeber_token

	has_many :friend_requests, :class_name => 'FriendRequest', :foreign_key => 'requestee_id', :dependent => :destroy
  	has_many :sent_requests, :class_name => 'FriendRequest', :foreign_key => 'requester_id', :dependent => :destroy

	has_many :friendships, :class_name => 'Friendship', :foreign_key => 'user_id', :dependent => :destroy
  	has_many :inverse_friendships, :class_name => 'Friendship', :foreign_key => 'friend_id', :dependent => :destroy

	has_many :friends, :through => :friendships
	has_many :inverse_friends, :through => :inverse_friendships, :source => :user
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, :presence => true, :uniqueness => true, :length => { :minimum => 3 }		
	validates :email, :presence => true, :uniqueness => { :case_sensitive => false }, :format => { :with => VALID_EMAIL_REGEX }
	validates :password, :presence => true, :length => { :minimum => 5 }
	validates :password_confirmation, presence: true
	
	def number_of_friends
		self.friendships.count + self.inverse_friendships.count	
	end

	def all_friends
		self.friends + self.inverse_friends
	end

	def mutual_friends_with(user)
		user.all_friends & self.all_friends
	end

	def mutual_friends_with_to_s(user)
		number_of_mutual_friends=self.mutual_friends_with(user).count
		return "mutual friends: #{number_of_mutual_friends}" if number_of_mutual_friends > 0
		return "no mutual friends" if number_of_mutual_friends == 0
	end

	def has_mutual_friends_with?(user)
		return true if self.mutual_friends_with(user).count > 0
	end
	private

		def create_remeber_token
			self.remeber_token = SecureRandom.urlsafe_base64
		end

end
