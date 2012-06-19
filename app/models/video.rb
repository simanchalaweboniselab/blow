class Video < ActiveRecord::Base
  has_many :comments
  has_many :video_tags, :dependent => :destroy
  has_many :tags, :through => :video_tags
  belongs_to :category
  attr_accessible :category_id, :image_url, :title, :video_url,:tags, :video_tags, :tag_ids
  #attr_accessible :name, :tags_attributes
  #accepts_nested_attributes_for :tags, :allow_destroy => true


  validates :category_id, :presence => true
  validates :video_url, :presence => true
  validates :image_url, :presence => true

  def short_date
  created_at.strftime("%d:%m:%y %H:%M:%S")
  end

end
