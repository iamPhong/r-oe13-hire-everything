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
      resources :news_need_rents do
        collection do
          get :myrents
        end
      end
    end
  end
end
