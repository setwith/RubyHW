Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      root to: 'articles#index_all'
      resources :authors, only: %i[index show create destroy] do
        get :published_comments
        get :unpublished_comments
      end
      resources :articles
      resources :likes, only: %i[create destroy]
      resources :comments, only: %i[index create update_status update destroy] do
        patch :update_status
      end
      resources :tags
    end
  end
end
