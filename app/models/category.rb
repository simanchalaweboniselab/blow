class Category < ActiveRecord::Base
  has_many :videos
  attr_accessible :name
  validates :name, :presence => true
end
