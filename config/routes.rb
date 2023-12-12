require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :funcionarios

  mount Sidekiq::Web => "/sidekiq"

  root 'indicators#index'
  resources :itens
  resources :produtos
  resources :vendas
  resources :funcionarios
  resources :fornecedores

  get '/backup', to: 'backup#backup'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
