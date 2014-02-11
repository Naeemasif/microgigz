class LeadsController < ApplicationController
  # GET /leads
  # GET /leads.json
 #load_and_authorize_resource :except => [:index]

  def index
    @leads = Lead.all

   # respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render json: @leads }
    #end
  end

  # GET /leads/1
  # GET /leads/1.json
  def show
    @lead = Lead.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lead }
    end
  end

  # GET /leads/new
  # GET /leads/new.json
  def new
    @lead = Lead.new
    @clients = Client.where(:status=>true).all


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lead }
    end
  end

  # GET /leads/1/edit
  def edit
    @lead = Lead.find(params[:id])
  end

  # POST /leads
  # POST /leads.json
  def create
    @lead = Lead.new(params[:lead])

    respond_to do |format|
      if @lead.save
        @lead.update_attributes(client_id:params[:names],status:"Active")
        format.html { redirect_to @lead, notice: 'Lead was successfully created.' }
        format.json { render json: @lead, status: :created, location: @lead }
      else
        format.html { render action: "new" }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /leads/1
  # PUT /leads/1.json
  def update
    @lead = Lead.find(params[:id])

    respond_to do |format|
      if @lead.update_attributes(params[:lead])
        format.html { redirect_to @lead, notice: 'Lead was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1
  # DELETE /leads/1.json
  def destroy
    @lead = Lead.find(params[:id])
    @lead.destroy

    respond_to do |format|
      format.html { redirect_to leads_url }
      format.json { head :no_content }
    end
  end

  def ajax_request
    @lead = Lead.find_by_id(params[:lead_id])
    @user = User.find_by_userable_id(@lead.client_id)

  end

  def convert_to_project
   @project = Project.create(title:params[:title],start_date:params[:date],status:params[:status],lead_id:params[:lead_id],client_id:params[:client_id])
   redirect_to  :controller=>"projects", :action=>"show",id:@project.id
  end

  def get_client_names
   @user = User.find_by_sql("select c.id, u.name from clients c, users u where u.name like '#{params[:search]}%' and (c.id=u.userable_id and u.userable_type='Client')")
  end

  def client_creation_form

  end
end
