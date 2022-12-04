Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root to: 'articles#index_all'
      resources :authors, only: %i[index show create published_comments unpublished_comments] do
        get :published_comments
        get :unpublished_comments
        resources :articles, only: %i[index index_all show create update destroy] do
          resources :comments,
                    only: %i[index show create update destroy published unpublished update_status] do
            patch :update_status
          end
        end
      end
    end
  end
end
