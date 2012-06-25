class Comment < ActiveRecord::Base
  belongs_to :my_post
  attr_accessible :comment
 #validates :comment, :presence => true
end
