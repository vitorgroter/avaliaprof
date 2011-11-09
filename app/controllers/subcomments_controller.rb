class SubcommentsController < ApplicationController
  before_filter :authenticate

  def create
    subject = Subject.find(params[:subcomment][:subject_id])
    @subcomment  = current_user.subcomments.build(params[:subcomment].merge({:subject => subject}))
    if @subcomment.save
      flash[:success] = "Comment created!"
      redirect_to subject_path(subject.id)
    else
      render 'pages/home'
    end
  end

  def destroy
    @subcomment = Subcomment.find(params[:id])
    if @subcomment.user == current_user or current_user.admin?
      @subcomment.destroy
      flash[:success] = "Comentario deletado."
    end
    redirect_to subject_path(@subcomment.subject.id)
  end
end

