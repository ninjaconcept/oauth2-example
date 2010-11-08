# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery

  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  filter_parameter_logging :password

  helper_method :current_user

  # include ApplicationController workings required for Oauth2 plugin
  include Oauth2::Provider::ApplicationControllerMethods


  protected

  # before filter to make sure user is logged in
  def login_required
    unless current_user
      store_location
      flash[:error] = "You must be logged in to access this page."
      redirect_to login_path
      return false
    end
  end

  # required by Oauth2 plugin, returns user id that will
  # serve as foreign key to authorize codes and access tokens
  def current_user_id_for_oauth
    current_user.id.to_s
  end  

  # required for oauth to actually work, we wrap our non-oauth
  # authentication filter with an opportunity to first determine
  # the request's user via an oauth header.
  def login_required_with_oauth
    if user_id = self.user_id_for_oauth_access_token
      UserSession.create(User.find(user_id))
      # session[:user_id] = user_id
    elsif looks_like_oauth_request?
      render :text => "Denied!", :status => :unauthorized
    else
      login_required_without_oauth
    end
  end
  alias_method_chain :login_required, :oauth

  def logged_in?
    !current_user.nil?
  end
  
  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
end