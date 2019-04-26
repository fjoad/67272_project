Rails.application.routes.draw do
  get 'manager_view_profile/index'
  get 'employee_view_profile/index'
  get 'guest_flavor_store/index'
  get 'guest_flavor_view/index'
  resources :loginpages
  resources :store_flavors
  resources :controllers
  get 'manager_shift_info/index'
  get 'employee_page/index'
  get 'manager_page/index'
  get 'admin_page/index'
  resources :shift_jobs
  resources :users
  resources :jobs
  resources :shifts
  resources :flavors
  resources :demos, only: [:new, :create, :destroy]
  get 'demos/new', to: 'loginpages#index', as: :login
  get 'demos/destroy', to: 'demos#destroy', as: :logout
  get 'page/mainpage'
  get 'admin_page/index'
  get 'manager_page/index'
  get 'manager_shift_info/index'
  get 'manager_assignment_info/index'
  get 'employee_page/index'
  resources :stores
  resources :employees
  resources :assignments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'demos#new'
end
