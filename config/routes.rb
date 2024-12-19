Rails.application.routes.draw do
  resources :categories
  resources :items do
    collection do
      get :search  
    end
  end
  
  # Root route
  root "items#index"
  
  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA (Progressive Web App) related routes
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # You can define other routes here as necessary
  # Defines the root path route ("/")
  # root "posts#index"
end
