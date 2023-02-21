Rails.application.routes.draw do
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'pages#home'
	get 'form', to: 'pages#form'
	resources :students, only: [:show, :index, :new, :create, :edit, :update, :destroy]
end
