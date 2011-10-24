class SubjectsController < ApplicationController
  def index
    @title = "Materias"
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
    @title = @subject.code
    @subcomments = @subject.subcomments
  end
end
