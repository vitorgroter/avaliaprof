# == Schema Information
#
# Table name: subjects
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Subject < ActiveRecord::Base
  attr_accessible :description
end
