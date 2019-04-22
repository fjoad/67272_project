Rails.application.routes.draw do
  resources :shift_jobs
  resources :users
  resources :jobs
  resources :shifts
  resources :flavors
  resources :demos, only: [:new, :create, :destroy]
  get 'demos/new', to: 'demos#new', as: :login
  get 'demos/destroy', to: 'demos#destroy', as: :logout
  get 'page/mainpage'
    resources :stores
    resources :employees
    resources :assignments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'demos#new'
end
