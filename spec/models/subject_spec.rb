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

require 'spec_helper'

describe Subject do

  before(:each) do
    @attr = {
      :name => "Calculo 1",
      :code => "MAT2453"
    }
  end

  it "should create a new instance given valid attributes" do
    Subject.create!(@attr)
  end

  it "should be in alphabetical order" do
    @sb1 = Factory(:subject, :code => "D", :name => "A")
    @sb2 = Factory(:subject, :code => "A", :name => "A")
    @sb3 = Factory(:subject, :code => "C", :name => "A")
    @sb4 = Factory(:subject, :code => "B", :name => "A")

    Subject.all.should == [@sb2, @sb4, @sb3, @sb1]
  end


  describe "subcomments associations" do
    before(:each) do
      @user = Factory(:user)
      @subject = Factory(:subject)
      @mp1 = Factory(:subcomment, :user => @user, :subject => @subject, :created_at => 1.day.ago)
      @mp2 = Factory(:subcomment, :user => @user, :subject => @subject, :created_at => 1.hour.ago)
    end

    it "should have a subcomment attribute" do
      @subject.should respond_to(:subcomments)
    end

    it "should have the right subcomment in the right order" do
      @subject.subcomments.should == [@mp2, @mp1]
    end

    it "should destroy associated subcomments" do
      @subject.destroy
      [@mp1, @mp2].each do |subcomment|
        Subcomment.find_by_id(subcomment.id).should be_nil
      end
    end
  end
end

