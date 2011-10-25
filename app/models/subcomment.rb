# == Schema Information
#
# Table name: subcomments
#
#  id         :integer         not null, primary key
#  comment    :text
#  subject_id :integer
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Subcomment < ActiveRecord::Base
  attr_accessible :comment, :subject
  belongs_to :user
  belongs_to :subject

  validates :comment, :presence => true
  validates :user_id, :presence => true
  validates :subject_id, :presence => true


  default_scope :order => 'subcomments.created_at DESC'
end
