Blow::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get "home/index"
  get "home/show"
  resources :categories do
    collection do
      get 'search'
    end
  end
  resources :videos do
    collection do
      get 'search'
    end
    collection do
      get 'comments'
    end
    collection do
      get 'video_views'
    end
    collection do
      get "most_popular_videos"
    end
  end
  resources :tags do
    collection do
      get 'search'
    end
  end
  resources :comments do
    collection do
      post 'comment'
    end
  end
  scope :module => "api" do
    resources :apis do
      collection do
        post 'sign_in'
      end
      collection do
        post 'reset_password'
      end

    end
  end
  match "/admin_actives", :to => "admin/admin_users#admin_actives"

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
  root :to => 'admin/dashboard#index'
  # See how all your routes lay out with "rake routes"
  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

end
