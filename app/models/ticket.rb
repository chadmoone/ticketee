class Ticket < ActiveRecord::Base
  attr_accessible :description, :project, :title
  belongs_to :project
  
  validates :title, :presence => true
  validates :description, :presence => true,
                          :length => {:minimum => 10}
end
