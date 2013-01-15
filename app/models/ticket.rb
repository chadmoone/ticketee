class Ticket < ActiveRecord::Base
  attr_accessible :description, :project, :title, :asset
  belongs_to :project
  belongs_to :user

  has_attached_file :asset
  
  validates :title, :presence => true
  validates :description, :presence => true,
                          :length => {:minimum => 10}
end
