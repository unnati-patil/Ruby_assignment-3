class MyPost < ActiveRecord::Base
  attr_accessible :description, :name, :title
  validates :name, :description, :title, :presence => true


end
