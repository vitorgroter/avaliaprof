require 'spec_helper'

describe ProfessorsController do
  render_views

  describe "GET 'index'" do
    before(:each) do
      first = Factory(:professor, :name => "Pait")
      second = Factory(:professor, :name => "Arnaldo")
      third  = Factory(:professor, :name => "Lebensztajn")

      @professors = [first, second, third]
    end

    it "should be successful" do
      get :index
      response.should be_success
    end

    it "should have the right title" do
      get :index
      response.should have_selector("title", :content => "Professores")
    end

    it "should have an element for each user" do
      get :index
      @professors.each do |professor|
        response.should have_selector("li", :content => professor.name)
      end
    end
  end

  describe "GET 'show'" do

    before(:each) do
      @user = Factory(:user)
      @professor = Factory(:professor)
      test_sign_in(@user)
    end

    it "should show the professor's procomments" do
      mp1 = Factory(:procomment, :user => @user, :professor => @professor, :comment => "Eeita")
      mp2 = Factory(:procomment, :user => @user, :professor => @professor, :comment => "Nossa!")
      get :show, :id => @professor
      response.should have_selector("span", :content => mp1.comment)
      response.should have_selector("span", :content => mp2.comment)
    end
  end
end

