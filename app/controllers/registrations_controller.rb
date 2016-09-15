class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:edit, :update, :destroy]
  load_and_authorize_resource
  
  def index
    @registrations = Registration.includes(:section => [:subject])
  end
  
  def new
    @subjects = Subject.joins(:sections).distinct
  end
  
  def create
    @registration = Registration.create(registration_params)
    redirect_to registrations_path
  end
  
  def edit
    @sections = Subject.includes(:sections).find(params[:subject_id]).sections
  end
  
  def edit_grade
  end
    
  def update
    @registration.update(registration_params)
    redirect_to registrations_path
  end
  
  def destroy
    @registration.destroy
    redirect_to registrations_path
  end
  
  def section_list
    @sections = Subject.find(params[:subject_id]).sections.pluck(:name, :id)
    respond_to do |format|
      format.json { render json: @sections }
    end
  end
  
  private
  
  def set_registration
    @registration = Registration.includes(:user).find(params[:id])
  end
  
  def registration_params
    params.require(:registration).permit(:section_id, :user_id, :grade)
  end

end
