class List < ActiveRecord::Base
  attr_accessible :title
  
  belongs_to :user
  has_many :tasks, :dependent => :destroy
  
  validates :title, :presence => true, :length => { :within => 1..140} 
  
    default_scope :order => 'lists.created_at DESC'
end
