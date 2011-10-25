require 'spec_helper'

describe SubjectsController do
  render_views

  describe "GET 'index'" do
    before(:each) do
      first = Factory(:subject, :code => "A", :description => "Materia A")
      second = Factory(:subject, :code => "B", :description => "Materia B")
      third  = Factory(:subject, :code => "C", :description => "Materia C")

      @subjects = [first, second, third]
    end

    it "should be successful" do
      get :index
      response.should be_success
    end

    it "should have the right title" do
      get :index
      response.should have_selector("title", :content => "Materias")
    end

    it "should have an element for each user" do
      get :index
      @subjects.each do |subject|
        response.should have_selector("li", :content => subject.code)
      end
    end
  end

  describe "GET 'show'" do

    before(:each) do
      @user = Factory(:user)
      @subject = Factory(:subject)
    end

    it "should show the subject's subcomments" do
      mp1 = Factory(:subcomment, :user => @user, :subject => @subject, :comment => "Eeita")
      mp2 = Factory(:subcomment, :user => @user, :subject => @subject, :comment => "Nossa!")
      get :show, :id => @subject
      response.should have_selector("span", :content => mp1.comment)
      response.should have_selector("span", :content => mp2.comment)
    end
  end

end

