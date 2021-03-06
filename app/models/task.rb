class Task < ActiveRecord::Base
  attr_accessible :content, :is_done
  
  belongs_to :list
  
  validates :content, :presence => true, :length => { :maximum => 140 }
  
  default_scope :order => 'tasks.created_at DESC'
end