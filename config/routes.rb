Howgeekwork::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root :to => "home#index"

  get '/view/:id' => 'home#show', as: :person
  get '/giktuts' => 'home#giktuts', as: :giktuts
  get '/about' => 'home#about', as: :about
  get '/lienhe' => 'home#lienhe', as: :lienhe
end
