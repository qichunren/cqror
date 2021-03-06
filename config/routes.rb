Cqror::Application.routes.draw do

  resources :blacklists

  resources :attachments

  resources :posts do
    member do
      get :tag
    end
    
    resources :comments
  end

  match 'contact-us' => "pages#contact"
  
  get "myblog/login" => "blog_panel/user_sessions#new"
  
  get "myblog/feed"    => "posts#feed", :defaults => { :format => 'rss' } 
  get 'myblog'         => "posts#index"
  get "myblog/about-me" => "pages#about_me"
  get "myblog/code_image" => "pages#code_image"
  get "myblog/:id"     => "posts#show" 
  get "myblog/tag/:id" => "posts#tag"      
  
                                

  


  namespace :blog_panel do
    resources :posts do
      member do
        delete :destroy_comment
      end
    end
    resources :comments
    resources :attachments
    resources :blacklists
    resource  :user_session
  end
  
  

  root :to => "welcome#index"

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
