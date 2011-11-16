# == Schema Information
#
# Table name: subjects
#
#  id          :integer         not null, primary key
#  code        :string(255)
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Subject < ActiveRecord::Base
  attr_accessible :code, :name, :description
  has_many :subcomments, :dependent => :destroy
  has_and_belongs_to_many :professors
  has_many :sub_stars


  validates :code,  :presence => true
  validates :name,  :presence => true

  default_scope :order => 'subjects.code ASC'
end
