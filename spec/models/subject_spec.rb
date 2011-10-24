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

  before(:each) do
    @attr = {
      :description => "Calculo 1",
      :code => "MAT2453"
    }
  end

  it "should create a new instance given valid attributes" do
    Subject.create!(@attr)
  end

  it "should be in alphabetical order" do
    @sb1 = Factory(:subject, :code => "D")
    @sb2 = Factory(:subject, :code => "A")
    @sb3 = Factory(:subject, :code => "C")
    @sb4 = Factory(:subject, :code => "B")

    Subject.all.should == [@sb2, @sb4, @sb3, @sb1]
  end
end

