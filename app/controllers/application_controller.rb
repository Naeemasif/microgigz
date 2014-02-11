class ApplicationController < ActionController::Base


  protect_from_forgery
 #before_filter :authenticate_user!
  before_filter :custom_user_auth
  private
      def custom_user_auth
             if !user_signed_in?
                render  'login/new'
              end
      end
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

end
