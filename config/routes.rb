Rails.application.routes.draw do


  get  'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :staffs
  resources :places
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
