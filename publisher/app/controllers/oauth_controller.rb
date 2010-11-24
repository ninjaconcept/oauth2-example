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
      'a12f32463bbd8d0bff944c5225c01fdc118ca1928cf5892ab46b11b4640935cf',  # client_id
      '46a4de0ea4a0a6c7a805717247170c82172e0668f72e6b23fb335fbafdb72cd3',  # client_secret
      :site => 'http://localhost:3000',
      :access_token_url => '/oauth/token'
    )
  end
  
  def access_token
    @access_token ||= OAuth2::AccessToken.new(client, current_user.oauth2_token)
  end
    
end