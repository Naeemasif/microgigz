class ApplicationController < ActionController::Base

  before_filter :authenticate
protected
  def authenticate
    unless session[:person]
      session[:return_to] = @request.request_uri
      redirect_to :controller => "login"
      return false
    end
  end

  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end
  protect_from_forgery

end
