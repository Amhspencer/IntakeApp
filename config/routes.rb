IntakeApp::Application.routes.draw do

  # root - index of : bcef.herokuapp.com
  root to:  'sessions#new'

  # Login - Logout - Session
  get    'createuser'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  # Process Form Routes
  get  'forms/process/:id(.:format)' => 'forms#showToProcess', :as => :showToProcess_form
  post 'forms/process/:id(.:format)' => 'forms#processForm', :as => :process_form
  
  # Static pages - Used to display additional information
  get "static_pages/disclaimer"
  get "static_pages/confirmation"
  get "static_pages/partnerdashboard"

  # Resouces - Including: new, show, edit etc ...
  resources :users
  resources :partners
  resources :admins
  resources :forms

  # Shortcut - Rather than long action routes
#get "partner_dashboard" => "static_pages#partnerdashboard"
  get    'createpartner'  => 'partners#new'
  get    'createadmin'  => 'admins#new'

  # Miscs
  get "admin/new"
  get "users/new"
  get "sessions/new"
  get 'admins/index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

