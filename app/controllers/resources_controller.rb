class ResourcesController < ApplicationController
  # GET /resources
  # GET /resources.json
 # load_and_authorize_resource :except => [:show, :edit, :update]

  def index
    @resources = Resource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resources }
    end
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
    @resource = Resource.find_by_id(params[:id])
    @user  = @resource.user
    @notes = @resource.notes
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resource }
    end
  end

  # GET /resources/new
  # GET /resources/new.json
  def new
    @resource = Resource.new
    @user = @resource.build_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resource }
    end
  end

  # GET /resources/1/edit
  def edit
    @resource = Resource.find_by_id(params[:id])
    @user = @resource.user
  end

  # POST /resources
  # POST /resources.json
  def create
    @resource = Resource.new(availability:params[:resource][:availability])

    respond_to do |format|
      if @resource.save
         @user = @resource.build_user(params[:resource][:user])
         @user.save
         session[:current_resource_id] = @resource.id
         format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
         format.json { render json: @resource, status: :created, location: @resource }
      else
         format.html { render action: "new" }
         format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resources/1
  # PUT /resources/1.json
  def update
    @resource = Resource.find_by_id(params[:id])
    respond_to do |format|
      if @resource.user.update_attributes(params[:resource][:user])
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource = Resource.find_by_id(params[:id])
    @resource.destroy

    respond_to do |format|
      format.html { redirect_to resources_url }
      format.json { head :no_content }
    end
  end
end
