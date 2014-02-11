class RoleassignmentsController < ApplicationController
  load_and_authorize_resource :except => [:index]

  def index
    @resources = Resource.all
    @roles = Role.all
  end

  def assign_role
    @user_role = UserRole.create(user_id:params[:user_id],role_id:params[:role_id])
    @resources = Resource.all
    @roles = Role.all

  end

  def delete_role
     @user_role = UserRole.delete_all(user_id:params[:user_id],role_id:params[:role_id])

     @resources = Resource.all
     @roles = Role.all

  end

end
