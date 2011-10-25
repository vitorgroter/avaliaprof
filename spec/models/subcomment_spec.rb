# == Schema Information
#
# Table name: subcomments
#
#  id         :integer         not null, primary key
#  comment    :text
#  subject_id :integer
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

require 'spec_helper'

describe Subcomment do
  before(:each) do
    @user = Factory(:user)
    @subject = Factory(:subject)
    @attr = { :comment => "materia importante", :subject => @subject}
  end

  it "should create a new instance given valid attributes" do
    @user.subcomments.create!(@attr)
  end

  describe "user associations" do

    before(:each) do
      @subcomment = @user.subcomments.create(@attr)
    end

    it "should have a user attribute" do
      @subcomment.should respond_to(:user)
    end

    it "should have the right associated user" do
      @subcomment.user_id.should == @user.id
      @subcomment.user.should == @user
    end
  end

  describe "validations" do
    it "should require a user id" do
      Subcomment.new(@attr).should_not be_valid
    end

    it "should require nonblank content" do
      @user.subcomments.build(:comment => "  ").should_not be_valid
    end
  end
end
