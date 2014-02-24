class ClientsController < ApplicationController
  # GET /clients
  # GET /clients.json
  #load_and_authorize_resource :except => [:index]

  def index
    @clients = Client.where(status:"Active")

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
    @user = @client.build_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client }
    end
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
    @user   = User.find_by_userable_id(@client)
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.create(company_name:params[:client][:company_name],status:params[:client][:status])
    @user = @client.build_user(params[:client][:user])
    @user.save!
    params[:request_page] = nil

    respond_to do |format|
      if @client.save
        format.js
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
    @client = Client.find_by_id(params[:id])

    respond_to do |format|
      if @client.update_attributes(:company_name => params[:company_name], :status => true)
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
    @client = Client.find_by_id(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end

  def get_client_names
    @search = params[:search]
    @client = Client.where(status:"Active")
  end
end


























#*********************************************************************************************************************************************
#@user   = User.find_by_sql("select c.id, u.name from clients c, users u where u.name like '#{params[:search]}%' and (c.id=u.userable_id and u.userable_type='Client')")
#@user = User.where("name like 'p%' and userable_type='Client'").select("name , userable_id as id")

# Client.joins("INNER JOIN users ON users.userable_id = clients.id and users.userable_type='Client' and clients.status='Active' and users.name like '#{params[:search]}%'")
# User.joins(:account).where("account_users.role = 1 AND accounts.subscription_end_date BETWEEN (NOW() - INTERVAL 8 DAY) AND (NOW() + INTERVAL 4 DAY)
#            AND accounts.account_type = '#{Account::TYPE_FREE}' AND accounts.payment_method = '#{Account::PAYMENT_TRIAL}'")
#@user=Client.joins(:user).where("clients.id=users.userable_id and users.userable_type='Client' and clients.status='Active' and users.name like '#{params[:search]}%'")
