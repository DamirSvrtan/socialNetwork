class Photo < ActiveRecord::Base

  attr_accessible :name, :public, :image, :tags
  validates :name, :presence => true
  validates_attachment_presence :image

  has_attached_file :image, :styles => { :medium => "150x150>"}, :default_url => "/images/style/missing.png"

  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"
  has_many :likes, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  



  def number_of_likes
	self.likes.count
  end


  def like_message(status)
	if status == :liked
		if self.number_of_likes == 1
			"You liked this photo"
		else
			"You and #{self.number_of_likes-1} #{'other'.pluralize(self.number_of_likes-1)} liked this photo"
		end
	elsif status == :not_liked
		unless self.number_of_likes.zero?
			"#{self.number_of_likes} #{'person'.pluralize(self.number_of_likes)} liked this photo"
		end
	end

  end

  def photo_viewable_by?(user)
		self.public == true || user.friends_with?(self.owner) || user == self.owner
  end


  def tagged_users
	users = []
	unless self.tags.nil?
      		self.tags.split(' ').each do |tag|
           		if User.find_by_name("#{tag.gsub('#','')}")
				users << User.find_by_name("#{tag.gsub('#','')}")
			end
		end
	end
	users		
  end



end
