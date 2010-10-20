ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.
  map.resources :developers
  map.resources :properties, :collection => {:search => :post }
  map.resources :users
  map.resources :articles
  map.resource :session
  
  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  
  map.about 'about_us', :controller => 'home', :action =>'about'
  map.contact_us 'contact_us', :controller => 'home', :action => 'contact_us'
  map.contact_us_list '/admin/contact_us', :controller => 'admin', :action => 'contact_us_list'
  map.news '/news', :controller => 'articles', :action => 'index'
  map.read_news '/news/:id', :controller => 'articles', :action => 'show'
  
  map.settings '/admin/settings', :controller => 'admin', :action => 'settings'
  map.edit_settings '/admin/settings/edit', :controller => 'admin', :action => 'edit_settings' # not used
  map.add_location '/admin/settings/add_location', :controller => 'admin', :action => 'add_location'
  map.remove_location '/admin/location/remove/:id', :controller => 'admin', :action => 'remove_location'
  map.add_price_range '/admin/settings/add_price_range', :controller => 'admin', :action => 'add_price_range'
  map.remove_price_range '/admin/price_range/remove/:id', :controller => 'admin', :action => 'remove_price_range'

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
  map.root :controller => 'home'

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
