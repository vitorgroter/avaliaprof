require 'spec_helper'

describe SubcommentsController do
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
      @subject = Factory(:subject)
    end

    describe "failure" do

      before(:each) do
        @attr = { :comment => "", :subject_id => @subject.id }
      end

      it "should not create a subcomment" do
        lambda do
          post :create, :subcomment => @attr
        end.should_not change(Subcomment, :count)
      end

      it "should render the home page" do
        post :create, :subcomment => @attr
        response.should render_template('pages/home')
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :comment => "Lorem Ipsum", :subject_id => @subject.id }
      end

      it "should create a subcomment" do
        lambda do
          post :create, :subcomment => @attr
        end.should change(Subcomment, :count).by(1)
      end

      it "should redirect to the subject page" do
        post :create, :subcomment => @attr
        response.should redirect_to(subject_path(@subject.id))
      end

      it "should have a flash message" do
        post :create, :subcomment => @attr
        flash[:success].should =~ /comment created/i
      end
    end
  end

  describe "DELETE 'destroy'" do

    before(:each) do
      @user = Factory(:user)
      @subcomment = Factory(:subcomment, :user => @user)
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
        @subcomment2 = Factory(:subcomment, :user => @user2)
        test_sign_in(@user)
      end

      it "should destroy his comment" do
        lambda do
          delete :destroy, :id => @subcomment
        end.should change(Subcomment, :count).by(-1)
      end

      it "should not destroy other people's comment" do
        lambda do
        delete :destroy, :id => @subcomment2
        end.should_not change(Subcomment, :count)
      end

      it "should protect the page" do
        delete :destroy, :id => @subcomment2
        response.should redirect_to(subject_path(@subcomment2.subject.id))
      end

      it "should redirect to the subject page" do
        delete :destroy, :id => @subcomment
        response.should redirect_to(subject_path(@subcomment.subject.id))
      end
    end

    describe "as an admin user" do

      before(:each) do
        admin = Factory(:user, :email => "admin@example.com", :admin => true)
        test_sign_in(admin)
      end

      it "should destroy the comment" do
        lambda do
          delete :destroy, :id => @subcomment
        end.should change(Subcomment, :count).by(-1)
      end

      it "should redirect to the subject page" do
        delete :destroy, :id => @subcomment
        response.should redirect_to(subject_path(@subcomment.subject.id))
      end
    end
  end
end


