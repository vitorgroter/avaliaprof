class SubjectsController < ApplicationController
  def index
    @title = "Materias"
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
    @title = @subject.code
    @subcomments = @subject.subcomments
    @stars = SubStar.average(:stars, :conditions => ['subject_id == ?', @subject.id])
    if signed_in?
      @subcomment = Subcomment.new
      @subcomment.subject = @subject
      
      @star = SubStar.where(:user_id => current_user.id, :subject_id => @subject.id)[0]
      if @star.nil?
        @star = @subject.sub_stars.new
      end
    end
  end
end
