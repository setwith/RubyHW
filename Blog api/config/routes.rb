Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :authors, only: %i[index show create] do
        get :published_comments
        get :unpublished_comments
        resources :articles, only: %i[index show create update destroy] do
          resources :comments,
                    only: %i[index show create update destroym published unpublished update_status] do
            patch :update_status
          end
        end
      end
    end
  end
end
