class RolesController < ApplicationController
  before_action :set_role, only: [:edit, :update, :destroy]
  load_and_authorize_resource
  
  def index
    @roles = Role.all
  end
  
  def new
    @role = Role.new
  end
  
  def create
    @role = Role.create(role_params)
    redirect_to roles_path
  end
  
  def edit
  end
    
  def update
    @role.update(role_params)
    redirect_to roles_path
  end
  
  def destroy
    @role.destroy
    redirect_to roles_path
  end
  
  private
  
  def set_role
    @role = Role.find(params[:id])
  end
  
  def role_params
    params.require(:role).permit(:name)
  end
end