Rails.application.routes.draw do

  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    devise_for :users
    get "/info", to: "users#info"
  end
end
