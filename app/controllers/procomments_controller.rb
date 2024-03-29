class ProcommentsController < ApplicationController
  before_filter :authenticate

  def create
    professor = Professor.find(params[:procomment][:professor_id])
    @procomment  = current_user.procomments.build(params[:procomment].merge({:professor => professor}))
    if @procomment.save
      flash[:success] = "Comment created!"
      redirect_to professor_path(professor.id)
    else
      render 'pages/home'
    end
  end

  def destroy
    @procomment = Procomment.find(params[:id])
    if @procomment.user == current_user or current_user.admin?
      @procomment.destroy
      flash[:success] = "Comentario deletado."
    end
    redirect_to professor_path(@procomment.professor.id)
  end
end

