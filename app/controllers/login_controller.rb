require 'ldap_connect'

class LoginController < ApplicationController

  def index

  end
    def new

    end
  def auth

    @ldap = LDAP.authenticate(params[:login][:name], params[:login][:password])
    if @ldap
      session[:username] = params[:login][:name]
      flash[:notice] = "Login is scuessful!"

    else
      flash[:notice] = "Login failed!"
      redirect_to :action => "new"
    end

  end

  # logout
  # clears the session
  def logout

    session[:username] = nil
    flash[:notice] = "Logged out"
    redirect_to :action => "index"
  end

end
