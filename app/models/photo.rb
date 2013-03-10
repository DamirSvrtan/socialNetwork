class Photo < ActiveRecord::Base

  attr_accessible :name, :public, :image
  has_attached_file :image, :styles => { :medium => "300x300>"}, :default_url => "/images/style/missing.png"
end
