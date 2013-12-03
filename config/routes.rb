Howgeekwork::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root :to => "home#index"

  get '/view/:id' => 'home#show', as: :person
  get 'home/giktuts' => 'home#giktuts', as: :giktuts
  get 'home/about' => 'home#about', as: :about
end
