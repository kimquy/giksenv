Howgeekwork::Application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => "home#index"

  get '/view/:id' => 'home#show', as: :person
  get '/giktuts' => 'home#giktuts', as: :giktuts
  get '/about' => 'home#about', as: :about
  get '/lienhe' => 'home#lienhe', as: :lienhe
  get '/people_by_tag/:tag' => 'home#people_by_tag'
end
