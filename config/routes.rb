# -*- encoding : utf-8 -*-
Bptest::Application.routes.draw do


  resources :start
  resources :vols, :path => "VolumeIssue"
  resources :vol_jops, :path => "VolumeIssueJOP"
  resources :doilists, :path => "EmbargoPaP"
  resources :mycodes, :path => "podcast"
  resources :homerights, :path => "homeright" do
    resources :regulars do 
      resource :editorial
    end  
  end
  resources :subject_sets, :path => "SubjectCodesCheck"
  resources :doi_comparisons, :path => "DOICheck"


  # The priority is based upon order of creation:
  # first created -> highest priority.
  #get 'podcast/:id', :as => 'podcastshow'
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
   root :to => 'start#index'

  # See how all your routes lay out with "rake routes"

end
