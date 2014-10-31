MonitorApp::Application.routes.draw do
  devise_for :users


  resources :companies do
    resources :activities

    resources :users do
      resources :activities
      end

    resources :projects do
      resources :activities
      end
    
  end
  get "/edit_my_company" => 'companies#edit_my_company', :as => :edit_my_company
  get "/my_company" => 'companies#my_company', :as => :my_company

  get "set_time" => "users#set_time", :as => :set_time

  # get "users/index"
  # get "users/show"
  # get "users/edit"
  # get "users/new"
  resources :users do
    resources :projects do # WRONG WILL HAVE TO REMOVE
      # route for generating token
      get "/token" => 'projects#generate_token'
    end
  end

  # post '/update_project' => 'projects#show'

  get "/my_project" => 'projects#company_project', as: :my_project

  get "/sign_up" => 'companies#sign_up', :as => :sign_up
  post "/create_company" => 'companies#create_company', :as => :create_user

  get "projects/monitortable" => "projects#monitortable"

  authenticated :user do
    root to: "projects#index", as: :authenticated_root
  end

  unauthenticated do
    root to: "welcome#index"
  end

  # match 'account' => 'users#account', :as => :account

  get "/account" => 'users#account', :as => :account

  # routes for api
  namespace :api, :defaults => {:format => :json} do
    resources :metrics
  end

  match '/page_not_found' => 'welcome#page_not_found', :via => :get
  get '*path' => redirect('/page_not_found')
 
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
