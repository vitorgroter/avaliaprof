class SubStarsController < ApplicationController
  before_filter :authenticate

  def create
    subject = Subject.find(params[:sub_star][:subject_id])
    @substar  = current_user.sub_stars.build(params[:sub_star].merge({:subject => subject}))
    
    if @substar.save
      flash[:success] = "Estrela criada!"
      redirect_to subject
    else
      render 'pages/home'
    end
  end
  
  def update
    @substar = SubStar.find(params[:id])
    if @substar.update_attributes(params[:sub_star])
      flash[:success] = "Estrela atualizada"
    end
    redirect_to @substar.subject
  end
end

