class VideoTag < ActiveRecord::Base
  attr_accessible :tag_id, :video_id
  belongs_to :video
  belongs_to :tag
end
