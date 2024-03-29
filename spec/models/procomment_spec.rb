# == Schema Information
#
# Table name: procomments
#
#  id           :integer         not null, primary key
#  comment      :text
#  user_id      :integer
#  professor_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe Procomment do
  before(:each) do
    @user = Factory(:user)
    @professor = Factory(:professor)
    @attr = { :comment => "lol", :professor => @professor}
  end

  it "should create a new instance given valid attributes" do
    @user.procomments.create!(@attr)
  end

  describe "user associations" do

    before(:each) do
      @procomment = @user.procomments.create(@attr)
    end

    it "should have a user attribute" do
      @procomment.should respond_to(:user)
    end

    it "should have the right associated user" do
      @procomment.user_id.should == @user.id
      @procomment.user.should == @user
    end
  end

  describe "validations" do
    it "should require a user id" do
      Procomment.new(@attr).should_not be_valid
    end

    it "should require nonblank content" do
      @user.procomments.build(:comment => "  ", :professor => @professor).should_not be_valid
    end
  end
end
