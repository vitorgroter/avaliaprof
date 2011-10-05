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
end

