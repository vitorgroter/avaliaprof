class ProfessorsController < ApplicationController
  def index
    @title = "Professores"
    @professors = Professor.all
  end

  def show
    @professor = Professor.find(params[:id])
    @title = @professor.name
    @procomments = @professor.procomments
    if signed_in?
      @procomment = Procomment.new
      @procomment.professor = @professor
    end
  end
end
