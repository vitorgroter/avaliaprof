class PagesController < ApplicationController
  def home
    @title = "Inicio"
  end

  def contact
    @title = "Contato"
  end

  def about
    @title = "Sobre"
  end
  
  def help
    @title = "Ajuda"
  end

end
