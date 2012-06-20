class Comment < ActiveRecord::Base
  belongs_to :video
  attr_accessible :active, :body

  #notes create new comment
  def create_comment(body, video_id) #called by comment api
    if Video.find_by_id(video_id)
      self.body = body
      self.video_id = video_id
      self.save
    else
      return nil
    end
  end
end
