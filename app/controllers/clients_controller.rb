class ClientsController < ApplicationController
  # GET /clients
  # GET /clients.json
  def index

    #@user = User.find_by_sql("select c.id,p.name from clients c,profiles p where c.id=p.profileable_id")
     @client = Client.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clients }
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @client = Client.find(params[:id])
    @user = @client.user
    @leads   =  @client.leads
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client }
    end
  end

  # GET /clients/new
  # GET /clients/new.json
  def new
    @client = Client.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client }
    end
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
    @user = User.find_all_by_userable_id(@client.id).first
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(:company_name => params[:company_name], :status =>"Active")

    respond_to do |format|
      if @client.save
        @user = User.new( :email => params[:email],:name => params[:name], :login_id => params[:login_id], :telephone=> params[:telephone], :password=>"12345678", :password_confirmation=>"12345678")
        @user.userable_id = @client.id
        @user.userable_type = "Client"
        @user.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render json: @client, status: :created, location: @client }
      else
        format.html { render action: "new" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.json
  def update
    @client = Client.find(params[:id])
    #@profile = Profile.find_all_by_profileable_id(:id)
    respond_to do |format|
      if @client.update_attributes(:company_name => params[:company_name], :status => true)
        #  @profile.update_attributes(:name =>params[:name], :email => params[:email], :telephone => params[:telephone])
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end
end
