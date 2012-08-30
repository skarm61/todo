class Task < ActiveRecord::Base
  attr_accessible :content, :is_done
  attr_accessor :list_id
  
  belongs_to :list
  
  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true
  
  default_scope :order => 'tasks.created_at DESC'
end
