Rails.application.routes.draw do
  get 'employee_page/index'
  get 'manager_page/index'
  get 'admin_page/index'
  resources :shift_jobs
  resources :users
  resources :jobs
  resources :shifts
  resources :flavors
  resources :demos, only: [:new, :create, :destroy]
  get 'demos/new', to: 'demos#new', as: :login
  get 'demos/destroy', to: 'demos#destroy', as: :logout
  get 'page/mainpage'
  get 'admin_page/index'
  get 'manager_page/index'
  get 'employee_page/index'
  resources :stores
  resources :employees
  resources :assignments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'demos#new'
end
