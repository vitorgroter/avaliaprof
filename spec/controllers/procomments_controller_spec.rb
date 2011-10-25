require 'spec_helper'

describe ProcommentsController do
  render_views

  describe "access control" do

    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(signin_path)
    end

    it "should deny access to 'destroy'" do
      delete :destroy, :id => 1
      response.should redirect_to(signin_path)
    end
  end

  describe "POST 'create'" do

    before(:each) do
      @user = test_sign_in(Factory(:user))
      @professor = Factory(:professor)
    end

    describe "failure" do

      before(:each) do
        @attr = { :comment => "", :professor_id => @professor.id }
      end

      it "should not create a procomment" do
        lambda do
          post :create, :procomment => @attr
        end.should_not change(Procomment, :count)
      end

      it "should render the home page" do
        post :create, :procomment => @attr
        response.should render_template('pages/home')
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :comment => "Lorem Ipsum", :professor_id => @professor.id }
      end

      it "should create a procomment" do
        lambda do
          post :create, :procomment => @attr
        end.should change(Procomment, :count).by(1)
      end

      it "should redirect to the home page" do
        post :create, :procomment => @attr
        response.should redirect_to(root_path)
      end

      it "should have a flash message" do
        post :create, :procomment => @attr
        flash[:success].should =~ /comment created/i
      end
    end
  end
end

