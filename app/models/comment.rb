class Comment < ActiveRecord::Base
  belongs_to :video
  attr_accessible :active, :body
end
