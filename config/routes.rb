Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  root "homes#index"
  resources :patients, :homes, :doctors, :appointments
end
