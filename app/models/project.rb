class Project < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :tickets, :dependent => :delete_all
  has_many :permissions, :as => :thing
  validates :name, :presence => true

  def self.viewable_by(user)
    joins(:permissions).where(:permissions => { :action => "view", :user_id => user.id })
  end
end