Rails.application.routes.draw do
  resources :images, only: [:index, :new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'images#index'
end
