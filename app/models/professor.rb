# == Schema Information
#
# Table name: professors
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Professor < ActiveRecord::Base
  attr_accessible :name
  has_many :procomments, :dependent => :destroy
  has_and_belongs_to_many :subjects


  validates :name,  :presence => true

  default_scope :order => 'name ASC'
end
