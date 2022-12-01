Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :authors
      resources :articles do
        resources :comments
        get :published_comments
        get :unpublished_comments
        patch :update_status
      end
    end
  end
end
