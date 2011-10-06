require 'spec_helper'

describe "Users" do

  describe "signup" do

    describe "failure" do

      it "should not make a new user" do
        lambda do
          visit signup_path
          fill_in "Nome",                 :with => ""
          fill_in "E-mail",               :with => ""
          fill_in "Senha",                :with => ""
          fill_in "Confirmacao da senha", :with => ""
          click_button
          response.should render_template('users/new')
          response.should have_selector("div#error_explanation")
        end.should_not change(User, :count)
      end
    end

    describe "success" do

      it "should make a new user" do
        lambda do
          visit signup_path
          fill_in "Nome",                 :with => "Example User"
          fill_in "E-mail",               :with => "user@example.com"
          fill_in "Senha",                :with => "foobar"
          fill_in "Confirmacao da senha", :with => "foobar"
          click_button
          response.should have_selector("div.flash.success",
                                        :content => "Welcome")
          response.should render_template('users/show')
        end.should change(User, :count).by(1)
      end
    end
  end
end
