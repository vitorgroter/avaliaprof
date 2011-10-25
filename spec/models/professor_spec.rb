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


  describe "procomments associations" do
    before(:each) do
      @user = Factory(:user)
      @professor = Factory(:professor)
      @mp1 = Factory(:procomment, :user => @user, :professor => @professor, :created_at => 1.day.ago)
      @mp2 = Factory(:procomment, :user => @user, :professor => @professor, :created_at => 1.hour.ago)
    end

    it "should have a procomment attribute" do
      @professor.should respond_to(:procomments)
    end

    it "should have the right procomment in the right order" do
      @professor.procomments.should == [@mp2, @mp1]
    end

    it "should destroy associated procomments" do
      @professor.destroy
      [@mp1, @mp2].each do |procomment|
        Procomment.find_by_id(procomment.id).should be_nil
      end
    end
  end
end

