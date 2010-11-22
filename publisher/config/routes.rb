ActionController::Routing::Routes.draw do |map|
  
  map.oauth_authorize '/oauth/start', :controller => 'oauth', :action => 'start'
  map.oauth_callback '/oauth/callback', :controller => 'oauth', :action => 'callback'

  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"

  map.resources :user_sessions
  map.resources :users
  
  map.root :controller => 'home'
end
