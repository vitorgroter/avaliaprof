class ProfStarsController < ApplicationController
  before_filter :authenticate

  def create
    professor = Professor.find(params[:prof_star][:professor_id])
    @profstar  = current_user.prof_stars.build(params[:prof_star].merge({:professor => professor}))
    
    if @profstar.save
      flash[:success] = "Estrela criada!"
      redirect_to professor
    else
      render 'pages/home'
    end
  end
  
  def update
    @profstar = ProfStar.find(params[:id])
    if @profstar.update_attributes(params[:prof_star])
      flash[:success] = "Estrela atualizada"
    end
    redirect_to @profstar.professor
  end
end

