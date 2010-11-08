class OauthController < ApplicationController
  def start
    redirect_to client.web_server.authorize_url(
      :redirect_uri => oauth_callback_url
    )
  end

  def callback
    access_token = client.web_server.get_access_token(
      params[:code], :redirect_uri => oauth_callback_url
    )

    @data = access_token.get('/articles.xml')
    # in reality you would at this point store the access_token.token value as well as 
    # any user info you wanted
    # render :json => json_data
  end

  protected

  def client
    @client ||= OAuth2::Client.new(
      'a12f32463bbd8d0bff944c5225c01fdc118ca1928cf5892ab46b11b4640935cf',  # client_id
      '46a4de0ea4a0a6c7a805717247170c82172e0668f72e6b23fb335fbafdb72cd3',  # client_secret
      :site => 'http://localhost:3000'
    )
  end
end