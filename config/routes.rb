AppEad::Application.routes.draw do

  resources :courses, :only => %w(index show)

  scope "/app" do
    devise_for :users, :controllers => { :sessions => "admin/sessions", 
                                         :registrations => "admin/registrations", 
                                         :passwords => "admin/passwords" 
                                       }, 
      :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification' }, 
      :path => "/"
  end
    
  namespace :admin, :path => "app/" do
    root :to => "home#index"
    resources :token_authentications, :only => [:create, :destroy]
    resources :users do
      get :allusers, :on => :collection
    end
    resources :forums do
      resources :messages
    end
    resources :assets, :except => :show
    resources :courses do
      resources :lessons, :except => [:index, :show]
      get :matriculations, :on => :member
      resource :chats do
        get :history, :on => :member
      end
    end
    resources :lessons, :except => [:new, :destroy] do
      get :copy, :on => :member
    end
    match "lesson/:lesson_id/viewlist" => "audit#index", :as => :audit_lesson
    match "alert/:alert_id/viewlist" => "audit#index", :as => :audit_alert
    resources :matriculations
    resources :alerts
  end
  root :to => "pages#index"
  
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
