# == Schema Information
#
# Table name: professors
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Professor do

  before(:each) do
    @attr = {
      :name => "Felipe Pait"
    }
  end

  it "should create a new instance given valid attributes" do
    Professor.create!(@attr)
  end

  it "should be in alphabetical order" do
    @te1 = Factory(:professor, :name => "Zucchi")
    @te2 = Factory(:professor, :name => "Arnaldo")
    @te3 = Factory(:professor, :name => "Toledo")
    @te4 = Factory(:professor, :name => "Lebensztajn")

    Professor.all.should == [@te2, @te4, @te3, @te1]
  end
end

