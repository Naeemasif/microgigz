class LeadsController < ApplicationController
  # GET /leads
  # GET /leads.json
 load_and_authorize_resource :except => [:index]

  def index
    if !params[:search].blank?
    @search = Lead.search do
      fulltext params[:search]
    end
    @leads = @search.results
    elsif !params[:start].blank? && !params[:end].blank?
      @leads = Lead.where(:created_at => params[:start]..params[:end]).all
    else
      @leads = Lead.all
    end

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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lead }
    end
  end

  # GET /leads/1/edit
  def edit
    @lead = Lead.find_by_id(params[:id])
  end

  # POST /leads
  # POST /leads.json
  def create
      @lead = Lead.new(params[:lead])

      respond_to do |format|
        if @lead.save
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

  def convert_lead_to_project
    @lead    = Lead.find_by_id(params[:lead_id])
    @project = Project.create(title:@lead.title,start_date:DateTime.now.to_date,status:"Active",lead_id:@lead.id,client_id:@lead.client_id)
    redirect_to  :controller=>"projects", :action=>"show",id:@project.id
  end

  def client_creation_form
      @client = Client.new
      @user = @client.build_user
  end
end
