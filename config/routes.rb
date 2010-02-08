ActionController::Routing::Routes.draw do |map|
  map.resources :positions

  map.resources :batches


  map.resources :committees, :has_many => :roles

  map.resources :system_parameters

  map.login "login", :controller => "user_sessions", :action => "new", :conditions => { :method => :get }
  map.connect "login", :controller => "user_sessions", :action => "create", :conditions => { :method => :post }
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  map.resources :users, :has_many => :positions
  map.resources :user_sessions
  map.resource :account

  map.root :controller => "pages", :action => "main"

end
