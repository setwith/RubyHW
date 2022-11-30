Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :author
      resources :articles do
        resources :comments do
          get :published
          get :unpublished
          patch :update_status
        end
      end
    end
  end
end
