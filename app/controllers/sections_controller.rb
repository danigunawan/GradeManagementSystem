class SectionsController < ApplicationController
  before_action :set_section, only: [:edit, :update, :destroy]
  load_and_authorize_resource
  
  def index
    @q = Subject.ransack(params[:q])
    @subjects = @q.result.includes(:sections => [:user]).order('sections.name DESC').distinct
  end
  
  def create
    @section = Section.create(section_params)
    flash[:success] = 'Section Created'
    redirect_to sections_path
  end
  
  def edit
  end
  
  def update
    @section.update(section_params)
    flash[:success] = 'Section Updated'
    redirect_to sections_path
  end
  
  def destroy
    @section.destroy
    flash[:success] = 'Section Deleted'
    redirect_to sections_path
  end
  
  private

  def set_section
    @section = Section.find(params[:id])
  end
  
  def section_params
    params.require(:section).permit(:subject_id, :user_id, :name)
  end

end
