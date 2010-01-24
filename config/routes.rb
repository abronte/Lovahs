ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'letters', :action => 'index'

  map.resources :password_resets
  map.resource :user_session

  map.resources :user_verifications

  map.resource :account, :controller => "users"
  map.resources :users
  
  map.sitemap "/sitemap.xml", :controller => "sitemap", :action => "index"
  
  map.connect 'letters/new', :controller => 'letters', :action => 'new'
  map.connect 'letters/share_email', :controller => 'letters', :action => 'share_email'
  map.connect 'letters/create/:id', :controller => 'letters', :action => 'create'
  map.connect 'letters/:id', :controller => 'letters', :action => 'show'
  
  map.connect 'letters/tag/:id/:sort', :controller => 'letters', :action => 'tag'
  
  map.connect 'privacy', :controller => 'application', :action => 'privacy'
  map.connect 'terms', :controller => 'application', :action => 'terms'

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
end
