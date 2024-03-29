# == Schema Information
#
# Table name: procomments
#
#  id           :integer         not null, primary key
#  comment      :text
#  user_id      :integer
#  professor_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Procomment < ActiveRecord::Base
  attr_accessible :comment, :professor
  belongs_to :user
  belongs_to :professor

  validates :comment, :presence => true
  validates :user_id, :presence => true
  validates :professor_id, :presence => true


  default_scope :order => 'procomments.created_at DESC'
end
