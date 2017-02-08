Rails.application.routes.draw do

  resources :places

  resources :staffs
  get 'sessions/index'
  post 'sessions/create'
  delete 'sessions/destroy'
  resources :staffs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
