require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Inicio")
  end

  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Contato")
  end

  it "should have an About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "Sobre")
  end

  it "should have a Help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => "Ajuda")
  end

  it "should have a signup page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Cadastro")
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "Sobre"
    response.should have_selector('title', :content => "Sobre")
    click_link "Ajuda"
    response.should have_selector('title', :content => "Ajuda")
    click_link "Sobre"
    response.should have_selector('title', :content => "Sobre")
    click_link "Inicio"
    response.should have_selector('title', :content => "Inicio")
    click_link "Cadastro"
    response.should have_selector('title', :content => "Cadastro")
  end


  describe "when not signed in" do
    it "should have a signin link" do
      visit root_path
      response.should have_selector("a", :href => signin_path,
                                         :content => "Sign in")
    end
  end

  describe "when signed in" do

    before(:each) do
      @user = Factory(:user)
      visit signin_path
      fill_in :email,    :with => @user.email
      fill_in :password, :with => @user.password
      click_button
    end

    it "should have a signout link" do
      visit root_path
      response.should have_selector("a", :href => signout_path,
                                         :content => "Sign out")
    end

    it "should have a profile link" do
      visit root_path
      response.should have_selector("a", :href => user_path(@user),
                                         :content => "Profile")
    end
  end
end
