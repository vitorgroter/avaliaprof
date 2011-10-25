class SubcommentsController < ApplicationController
  before_filter :authenticate

  def create
    @subject = Subject.find(params[:subcomment][:subject_id])
    @subcomment  = current_user.subcomments.build(params[:subcomment].merge({:subject => @subject}))
    if @subcomment.save
      flash[:success] = "Comment created!"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

  def destroy
  end
end

