Blogger::Application.routes.draw do

  root to: 'articles#index'
  resources :articles do
    resources :comments
  end
  resources :tags
  resources :authors

  resources :author_sessions, only: [ :new, :create, :destroy ]
  resources :date_search, only: [:index, :show]
  resources :most_popular, only: [:index]

  get 'login' => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'
end
