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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
