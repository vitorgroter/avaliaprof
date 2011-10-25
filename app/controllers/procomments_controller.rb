class ProcommentsController < ApplicationController
  before_filter :authenticate

  def create
    @professor = Professor.find(params[:procomment][:professor_id])
    @procomment  = current_user.procomments.build(params[:procomment].merge({:professor => @professor}))
    if @procomment.save
      flash[:success] = "Comment created!"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

  def destroy
  end
end

