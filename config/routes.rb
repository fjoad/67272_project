Rails.application.routes.draw do
  resources :users
  resources :jobs
  resources :shifts
  resources :flavors
  get 'page/mainpage'
    resources :stores
    resources :employees
    resources :assignments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'page#mainpage'
end
