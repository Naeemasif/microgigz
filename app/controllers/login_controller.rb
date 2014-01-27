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
      flash[:notice] = "Login is scuessful!"
      if session[:return_to]
        redirect_to_path(session[:return_to])
        session[:return_to] = nil
      else
        redirect_to :controller => "leads"
      end
    else
      flash[:notice] = "Login failed!"
      redirect_to :action => "new"
    end

  end

  # logout
  # clears the session
  def abc
    session[:username] = nil
    flash[:notice] = "Logged out"
    redirect_to :controller=>"leads",:action=>"index"
  end

end
