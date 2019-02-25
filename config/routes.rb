Rails.application.routes.draw do

  post "/rate" => "rater#create", :as => "rate"
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    devise_for :users

    namespace :guest do
      resources :news_leases do
        collection do
          get :myleases
          match "search" => "news_leases#search", via: [:get, :post], as: :search
          get "tag" => "news_leases#tag", as: :tag
        end
      end
      resources :news_need_rents do
        collection do
          get :myrents
        end
      end
      resources :category do
        match "filter" => "category#filter", via: [:get, :post], as: :filter
      end
    end
  end
end
