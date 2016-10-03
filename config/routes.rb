Rails.application.routes.draw do
  # root :to => 'home#index'
  # devise_for :users, controllers: {registrations: "users/registrations"}
  # get "*path" => redirect("/")
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      devise_for :users, controllers: {registrations: "api/v1/registrations"}
      resources :categories
    end
  end
end
