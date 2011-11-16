# == Schema Information
#
# Table name: prof_stars
#
#  id           :integer         not null, primary key
#  professor_id :integer
#  stars        :integer
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer
#

class ProfStar < ActiveRecord::Base
	attr_accessible :professor, :stars

	belongs_to :professor
	belongs_to :user

	validates :professor_id, :presence => true
	validates :user_id, :presence => true
	validates_uniqueness_of :user_id, :scope => [:professor_id]
	
	validates :stars, :numericality => {:presence => true, :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 5 }

end
