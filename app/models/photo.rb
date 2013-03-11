class Photo < ActiveRecord::Base

  attr_accessible :name, :public, :image
  has_attached_file :image, :styles => { :medium => "150x150>"}, :default_url => "/images/style/missing.png"

  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"
  has_many :likes


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
end
