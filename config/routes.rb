Rails.application.routes.draw do
  resources :brands
  get 'welcome/index'
  resources :pods
  root to: 'welcome#index'
end
