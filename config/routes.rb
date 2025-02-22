Rails.application.routes.draw do
  # root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "pokemons#index"
  resources :trainers, only: [:index, :show, :new, :create]
  resources :pokemons do
    resources :pokeballs, only: [:create]
  end
  get 'search', to: 'pokemons#search', as: 'search_pokemons'
  get 'random', to: 'pokemons#random', as: 'random_pokemon'
  resources :pokeballs, only: [:destroy]
end
