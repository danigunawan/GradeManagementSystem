class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:edit, :update, :destroy]
  load_and_authorize_resource
  
  def index
    @registers = Registration.all
  end
  
  def new
    @register = Registration.new
  end
  
  def create
    @register = Registration.create(registration_params)
    redirect_to registrations_path
  end
  
  def edit
  end
    
  def update
    @register.update(registration_params)
    redirect_to registrations_path
  end
  
  def destroy
    @register.destroy
    redirect_to registrations_path
  end
  
  private
  
  def set_registration
    @register = Registration.find(params[:id])
  end
  
  def registration_params
    params.require(:registration).permit(:subject_id, :user_id, :grade)
  end

end
