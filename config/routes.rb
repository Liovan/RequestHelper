Rails.application.routes.draw do
  get 'forms/index'

  get 'forms/show'

  root 'sessions#new'
  get  'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :staffs
  resources :places
  resources :features do
    resources :needs
  end
  resources :students
  resources :requests
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
