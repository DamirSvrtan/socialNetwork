class MailingList < ActiveRecord::Base
  attr_accessible :email
  validates :email, :presence => true
  validates :email, :uniqueness => true

  scope :invalid_email, select { |ml| ml.email !~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
