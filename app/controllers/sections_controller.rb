class SectionsController < ApplicationController
  before_action :set_section, only: [:edit, :update, :destroy]
  load_and_authorize_resource
  
  def index
    @subjects = Subject.joins(:sections).distinct
  end
  
  def create
    @section = Section.create(section_params)
    redirect_to sections_path
  end
  
  def edit
  end
  
  def update
    @section.update(section_params)
    redirect_to sections_path
  end
  
  def destroy
    @section.destroy
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
