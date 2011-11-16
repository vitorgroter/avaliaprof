class ProfessorsController < ApplicationController
  def index
    @title = "Professores"
    @professors = Professor.all
  end

  def show
    @professor = Professor.find(params[:id])
    @title = @professor.name
    @procomments = @professor.procomments
    @stars = ProfStar.average(:stars, :conditions => ['professor_id == ?', @professor.id])
    if signed_in?
      @procomment = Procomment.new
      @procomment.professor = @professor
      
      @star = ProfStar.where(:user_id => current_user.id, :professor_id => @professor.id)[0]
      if @star.nil?
        @star = @professor.prof_stars.new
      end
    end
  end
end
