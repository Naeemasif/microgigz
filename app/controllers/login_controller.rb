require 'ldap_connect'

class LoginController < ApplicationController
  skip_before_filter :custom_user_auth
  def index
  end
  def new
  end


 def auth
    @ldap = LDAP.authenticate(params[:login][:name], params[:login][:password])
    if @ldap
      @user = User.find_all_by_login_id(params[:login][:name]).first

       if @user.nil?
         @resource = Resource.create()
         @user = User.new( :userable_id => @resource.id,:userable_type => "Resource",:email => "#{params[:login][:name]}@nxb.com.pk", :login_id => params[:login][:name],  :password=>"12345678", :password_confirmation=>"12345678")
           if @user.save
             sign_in(@user)
             flash[:notice] = "Signed in scuessfully"
             redirect_to edit_resource_path(@resource.id)
           end
       else
         sign_in(@user)
         flash[:notice] = "Signed in scuessfully"
         redirect_to :controller => "leads"
      end

        #session[:username] = params[:login][:name]
        #@username = session[:username]
        #sign_in(@ldap)

        #@existing_user =  User.find_all_by_login_id(session[:username]).first
      #if @existing_user.nil?
       #  redirect_to new_resource_path
       # else
         # session[:current_resource_id] = @existing_user.userable_id
           # if session[:return_to]
            #  redirect_to_path(session[:return_to])
             # session[:return_to] = nil
            #else
             # redirect_to :controller => "leads"
            #end
      #end
    else
      @user = User.find_all_by_login_id(params[:login][:name]).first

      if @user.valid_password?(params[:login][:password])
          sign_in(@user)
          redirect_to :controller => "leads"
      else
          flash[:alert] = "Login failed!"
          redirect_to :action => "new"
      end
    end
end

  def signout
    session[:username] = nil
    flash[:notice] = "Logged out"
    redirect_to :controller=>"leads",:action=>"index"
  end

end
