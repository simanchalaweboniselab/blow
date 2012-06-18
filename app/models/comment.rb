class Comment < ActiveRecord::Base
  belongs_to :video
  attr_accessible :active, :body

  def create_comment(body, video_id)
    self.body = body
    self.video_id = video_id
    self.save
  end
end
