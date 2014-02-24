Microgigz::Application.routes.draw do

  root :to => 'leads#index'

  resources :leads
  post '/leads/convert_to_project'=>'leads#convert_lead_to_project'
  post '/leads/ajax_request'=>'leads#ajax_request'
  post '/leads/client_creation_form'=> 'leads#client_creation_form'

  resources :projects
  get  '/projects/display_resources'=>'projects#display_resources'
  post  '/projects/get_client_name'=>'projects#get_client_name'

  resources :clients
  post '/clients/client'=>'clients#get_client_names'

  get  '/login/new'=>'login#new'
  get  '/login/signout'=>'login#signout'
  post '/login/auth'=>'login#auth'

  resources :roleassignments, :only => [:index,:assign_role]
  post '/roleassignments/assign_role'=>'roleassignments#assign_role'
  post '/roleassignments/delete_role'=>'roleassignments#delete_role'
  resources :profiles
  resources :resources
  resources :skills
  devise_for :users



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


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
