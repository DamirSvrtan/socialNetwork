class Photo < ActiveRecord::Base

  attr_accessible :name, :public, :image
  has_attached_file :image, :styles => { :medium => "150x150>"}, :default_url => "/images/style/missing.png"

  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"

end
