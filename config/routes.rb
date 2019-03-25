Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    devise_for :users

    namespace :guest do
      resources :news_leases do
        collection do
          get :myleases
        end
      end
      resources :news_need_rents do
        collection do
          get :myrents
        end
      end
      resources :category, only: :show
    end
  end
end
