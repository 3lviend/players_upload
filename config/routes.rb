Rails.application.routes.draw do
  resources :images, only: [:index, :new, :create, :destroy]
  resources :plays, only: [:create]
  get 'play_random' => 'images#play_random', as: :play_random
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'images#index'
end
