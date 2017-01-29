Rails.application.routes.draw do
  match 'sessions/:action',controller:"sessions",via: :all

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
