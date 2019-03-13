Rails.application.routes.draw do

  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    devise_for :users

    namespace :guest do
      resources :news_leases do
        collection do
          get :myleases
        end
      end
    end
  end
end
