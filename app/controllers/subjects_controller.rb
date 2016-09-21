class SubjectsController < ApplicationController
  before_action :set_subject, only: [:edit, :update, :destroy]
  load_and_authorize_resource

  def new
    @subject = Subject.new
  end
  
  def create
    @subject = Subject.create(subject_params)
    flash[:success] = 'Subject Created'
    redirect_to home_path
  end
  
  def edit
  end
  
  def update
    @subject.update(subject_params)
    flash[:success] = 'Subject Updated'
    redirect_to home_path
  end
  
  def destroy
    @subject.destroy
    flash[:success] = 'Subject Destroyed'
    redirect_to home_path
  end
  
  private
  
  def set_subject
    @subject = Subject.find(params[:id])
  end
  
  def subject_params
    params.require(:subject).permit(:course_code, :course_name)
  end

end
