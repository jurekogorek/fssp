class Ars
  def self.matches?(request)
    request.subdomain.present? && request.subdomain == "ars"
  end
end
class Sedilla
  def self.matches?(request)
    request.subdomain.present? && request.subdomain == "sedilla"
  end
end

Fssp::Application.routes.draw do
  resources :images


  match "/powiadomienia/:id/hide", to: "powiadomienia#hide"
  resources :powiadomienia

  get "main/index"
 

  resources :articles do
    get :autocomplete_menu_item_title, :on => :collection
    get :autocomplete_image_title, :on => :collection
  end
  
  resources :menu_items do
    get :autocomplete_menu_item_title, :on => :collection
  end
  root :to => redirect("/menu_items/17"),:constraints=>{:domain=>"constitueseos.pl"}
  constraints(Sedilla) do
    match '/' => redirect("/menu_items/2")
  end
  constraints(Ars) do
    match '/' => redirect("/menu_items/54")
    #match '/' => redirect("/menu_items/54")
  end
  root :to => 'main#index'

  resources :users do
    get :autocomplete_user_name, :on => :collection
  end

   controller :sessions do
    get "login" => :new
    post 'login' => :create
    delete 'logout' =>:destroy
  end

  resources :pictures

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
