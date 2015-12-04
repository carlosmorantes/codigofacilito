Rails.application.routes.draw do
  
  resources :comments
  devise_for :users
  root 'welcome#index'

  resources :articles
=begin RESTful
  get "/articles" index
  post "/articles" create
  delete "/articles/:id" destroy
  get "/articles/:id" show
  get "/articles/new" new
  get "/articles/:id/edit" edit
  patch "/articles/id" update
  put "/articles/id" updtate
=end



  #get 'special', to: "welcome#index"

  
end
