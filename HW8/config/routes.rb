Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root to: 'articles#index_all'
      resources :authors, only: %i[index show create destroy] do
        get :published_comments
        get :unpublished_comments
      end
      resources :articles do
      end
      resources :likes, only: %i[create destroy]
      resources :comments, only: %i[index create update_status update destrot] do
        patch :update_status
      end
      resources :tags
    end
  end
end
