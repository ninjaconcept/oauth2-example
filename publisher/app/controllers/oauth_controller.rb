class OauthController < ApplicationController
  before_filter :login_required
  
  # get authorization code
  def start
    redirect_to client.web_server.authorize_url(:redirect_uri => oauth_callback_url)
  end

  # get access_token and save it
  def callback
    access_token = client.web_server.get_access_token(params[:code], :redirect_uri => oauth_callback_url)
    
    current_user.update_attribute(:oauth2_token, access_token.token)
    flash[:notice] = "Authorized successfully!"
    
    redirect_to root_url
  end
  
  # get resources with access_token
  def get_articles
    @articles = ActiveSupport::JSON.decode(access_token.get('/articles.json'))
  end

  protected

  def client
    @client ||= OAuth2::Client.new(
      '0a45ed6686c63580bf8fc44d54783db8a2659881ab4ad05ca4007578bfba414c',  # client_id
      'daaaad1d6437ca12a7d0a1ed30bc4d69f98050ad605d56855a01c8b0334fdea0',  # client_secret
      :site => 'http://localhost:3000',
      :access_token_url => '/oauth/token'
    )
  end
  
  def access_token
    @access_token ||= OAuth2::AccessToken.new(client, current_user.oauth2_token)
  end
    
end