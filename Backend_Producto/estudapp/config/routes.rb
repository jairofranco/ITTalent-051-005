Rails.application.routes.draw do
  resources :clients
  resources :pre_registrations
  resources :surveys
  resources :schedule_courses
  resources :courses
  resources :rols
  resources :categories
  devise_for :users
#  devise_for :installs
#  get 'welcome/index'
root :to => 'welcome#index' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
