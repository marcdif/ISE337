Rails.application.routes.draw do

  get 'books/new', to: 'books#new'
  get 'checkout/:id', to: 'books#checkout'
  get 'edit/:id', to: 'books#edit'
  post 'edit/:id', to: 'books#update'
  get 'books/search_admin', to: 'books#search_admin'
  
  get 'addreview/:id', to: 'reviews#addreview'
  get 'reviews/:id', to: 'reviews#show'
  
  get 'administrator', to: 'administrator#index'
  get 'patron', to: 'patron#index'
  
  root 'welcome#index'

  resources :books do
    resources :reviews
  end

end
