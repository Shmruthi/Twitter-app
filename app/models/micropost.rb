class Micropost < ActiveRecord::Base
  attr_accessible :content, :micropost_id
belongs_to :user
has_many :comments,:dependent => :destroy, :foreign_key => 'msg_id'

  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true

default_scope :order => 'microposts.created_at DESC'
scope :from_users_followed_by,lambda{|user| followed_by(user)} 


  private
  def self.followed_by(user)
    followed_ids = %(SELECT followed_id FROM relationships WHERE follower_id = :user_id)
    where("user_id IN (#{followed_ids}) OR user_id = :user_id", :user_id => user)

    #Better way
    #user_ids = user.following.map(&:id)
    #user_ids << user.id
    #Micropost.where(:user_id => user_ids.uniq)

  end




end
