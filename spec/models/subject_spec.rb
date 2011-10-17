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

require 'spec_helper'

describe Subject do

  it "should create a new instance given valid attributes" do
    Subject.create!(@attr)
  end
end
