class Photo < ActiveRecord::Base
  after_save :handle_tags

  attr_accessible :name, :public, :image, :tagz

  attr_accessor :tagz

  validates :name, :presence => true
  validates_attachment_presence :image

  has_attached_file :image, :styles => { :medium => "150x150>"}, :default_url => "/images/style/missing.png"

  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"
  has_many :likes, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  has_and_belongs_to_many :tags
  



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

  def handle_tags
      a_tags = tagz.split(', ')
      a_tags.each do |tag|
      		new_tag = Tag.where(:name => tag).first_or_create
		self.tags << new_tag
		new_tag.counter += 1
		new_tag.save
      end
  end

end
