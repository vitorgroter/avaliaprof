class ProfessorsController < ApplicationController
  def index
    @title = "Professores"
    @professors = Professor.all
  end

  def show
    @professor = Professor.find(params[:id])
    @title = @professor.name
    @procomments = @professor.procomments
  end
end