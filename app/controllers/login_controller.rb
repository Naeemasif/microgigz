require 'ldap_connect'

class LoginController < ApplicationController
  skip_before_filter :authenticate
  def index

  end
    def new

    end
  def auth

    @ldap = LDAP.authenticate(params[:login][:name], params[:login][:password])
    if @ldap
        session[:username] = params[:login][:name]
        @username = session[:username]
        flash[:notice] = "Login is scuessful!"
         @u =  User.find_all_by_login_id(session[:username]).first

      if @u.nil?
         redirect_to new_resource_path
        else
              session[:current_resource_id] = @u.userable_id
              if session[:return_to]
                redirect_to_path(session[:return_to])
                session[:return_to] = nil
              else
                redirect_to :controller => "leads"
              end
      end
    else
      @user = User.find_all_by_login_id(params[:login][:name]).first
      if @user
        sign_in(@user)
      else
      flash[:notice] = "Login failed!"
      redirect_to :action => "new"
      end
    end

  end

  # logout
  # clears the session
  def signout
    session[:username] = nil
    flash[:notice] = "Logged out"
    redirect_to :controller=>"leads",:action=>"index"
  end

end
