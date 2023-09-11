Rails.application.routes.draw do



  get 'groups/new'
  get 'groups/index'
  get 'groups/show'
  get 'groups/edit'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: 'homes#top'
get 'home/about' => "homes#about", as:"about"
get "search" => "searches#search"
get 'chat/:id', to: 'chats#show', as: 'chat'
resources :chats, only: [:create]
resources :books do
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
end
resources :groups, only: [:new, :index, :show, :create, :edit, :update]
resources :users do
  member do
      get :follows, :followers
    end
      resource :relationships, only: [:create, :destroy]

    get "search" => "users#search"
    end

end
