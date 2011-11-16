# == Schema Information
#
# Table name: sub_stars
#
#  id         :integer         not null, primary key
#  subject_id :integer
#  user_id    :integer
#  stars      :integer
#  created_at :datetime
#  updated_at :datetime
#

class SubStar < ActiveRecord::Base
	attr_accessible :subject, :stars

	belongs_to :subject
	belongs_to :user

	validates :subject_id, :presence => true
	validates :user_id, :presence => true
	validates_uniqueness_of :user_id, :scope => [:subject_id]
	
	validates :stars, :numericality => {:presence => true, :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 5 }

end
