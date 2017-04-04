Rails.application.routes.draw do

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
  resources :forms
  resources :request_students
  resources :statistics, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
