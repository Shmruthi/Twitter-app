class Comment < ActiveRecord::Base

  attr_accessible :content, :msg_id

  belongs_to :micropost, :foreign_key => :msg_id, :class_name => Micropost

  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :msg_id, :presence => true

  default_scope :order => 'comments.created_at DESC'

end
