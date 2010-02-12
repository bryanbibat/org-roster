ActionController::Routing::Routes.draw do |map|
  map.resources :password_resets
  map.resources :positions
  map.resources :batches, :member => { :possible_buddies => :get }
  map.resources :committees, :has_many => :roles

  map.resources :system_parameters

  map.login "login", :controller => "user_sessions", :action => "new", :conditions => { :method => :get }
  map.connect "login", :controller => "user_sessions", :action => "create", :conditions => { :method => :post }
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  map.resources :users, :has_many => :positions, :member => { :edit_credentials => :get, :update_credentials => :put }
  map.resources :user_sessions
  map.resource :account

  map.readme "readme", :controller => "pages", :action => "readme"

  map.root :controller => "pages", :action => "main"

end
