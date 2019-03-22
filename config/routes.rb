Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  get 'articles/:article_id/comments', to: 'articles#index'
  resources :articles do
  	resources :comments, only: [:index, :create, :new]
  end
  resources :comments, only: [:update, :edit, :show, :destroy]
  #get 'welcome', to: 'welcome#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
