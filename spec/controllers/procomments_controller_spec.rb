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

      it "should redirect to the professor page" do
        post :create, :procomment => @attr
        response.should redirect_to(professor_path(@professor.id))
      end

      it "should have a flash message" do
        post :create, :procomment => @attr
        flash[:success].should =~ /comment created/i
      end
    end
  end

  describe "DELETE 'destroy'" do

    before(:each) do
      @user = Factory(:user)
      @procomment = Factory(:procomment, :user => @user)
    end

    describe "as a non-signed-in user" do
      it "should deny access" do
        delete :destroy, :id => @user
        response.should redirect_to(signin_path)
      end
    end

    describe "as a non-admin user" do
      before(:each) do
        @user2 = Factory(:user, :email => Factory.next(:email))
        @procomment2 = Factory(:procomment, :user => @user2)
        test_sign_in(@user)
      end

      it "should destroy his comment" do
        lambda do
          delete :destroy, :id => @procomment
        end.should change(Procomment, :count).by(-1)
      end

      it "should not destroy other people's comment" do
        lambda do
        delete :destroy, :id => @procomment2
        end.should_not change(Procomment, :count)
      end

      it "should protect the page" do
        delete :destroy, :id => @procomment2
        response.should redirect_to(professor_path(@procomment2.professor.id))
      end

      it "should redirect to the professor page" do
        delete :destroy, :id => @procomment
        response.should redirect_to(professor_path(@procomment.professor.id))
      end
    end

    describe "as an admin user" do

      before(:each) do
        admin = Factory(:user, :email => "admin@example.com", :admin => true)
        test_sign_in(admin)
      end

      it "should destroy the comment" do
        lambda do
          delete :destroy, :id => @procomment
        end.should change(Procomment, :count).by(-1)
      end

      it "should redirect to the professor page" do
        delete :destroy, :id => @procomment
        response.should redirect_to(professor_path(@procomment.professor.id))
      end
    end
  end
end

