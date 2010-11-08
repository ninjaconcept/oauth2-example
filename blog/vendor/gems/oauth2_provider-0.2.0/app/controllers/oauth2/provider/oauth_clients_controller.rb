# Copyright (c) 2010 ThoughtWorks Inc. (http://thoughtworks.com)
# Licenced under the MIT License (http://www.opensource.org/licenses/mit-license.php)

module Oauth2
  module Provider
    class OauthClientsController < ApplicationController
      unloadable
      
      def index
        @oauth_clients = OauthClient.all
      end

      def show
        @oauth_client = OauthClient.find(params[:id])
      end

      def new
        @oauth_client = OauthClient.new
      end

      def edit
        @oauth_client = OauthClient.find(params[:id])
      end

      def create
        @oauth_client = OauthClient.new(params[:oauth_client])
        
        if @oauth_client.save
          flash[:notice] = 'OauthClient was successfully created.'
          redirect_to :action => 'index'
          return
        else
          render :action => "new" 
        end
      end

      def update
        @oauth_client = OauthClient.find(params[:id])

        if @oauth_client.update_attributes(params[:oauth_client])
          flash[:notice] = 'OauthClient was successfully updated.'
          redirect_to :action => 'index'
          return
        else
          render :action => "edit"
        end
      end

      def destroy
        @oauth_client = OauthClient.find(params[:id])
        @oauth_client.destroy

        redirect_to(oauth_clients_url)
      end
    end
  end
end
