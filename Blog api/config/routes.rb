Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :authors do
        resources :articles do
          resources :comments
          get :published
          get :unpublished
          patch :update_status
        end
      end
    end
  end
end
