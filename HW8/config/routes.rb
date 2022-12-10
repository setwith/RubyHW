Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root to: 'articles#index_all'
      resources :authors, only: %i[index show create published_comments unpublished_comments destroy] do
        get :published_comments
        get :unpublished_comments
      end
      resources :articles, only: %i[index index_all show create update destroy]
      resources :likes, only: %i[create destroy]
      resources :comments,
                only: %i[index create update destroy update_status] do
        patch :update_status
      end
      resources :tags
    end
  end
end
