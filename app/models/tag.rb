class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :video_tags
  has_many :videos, :through => :video_tags
end
