AlingnenaApp::Application.routes.draw do
  resources :debts

  get 'products' => 'products#index', :as => 'products'
  post 'products' => 'products#create'
  get 'products/new' => 'products#new', :as => 'new_product' 
  get 'products/search' => 'products#search', :as => 'search_products'
  get 'products/:id' => 'products#show', :as => 'product'
  delete 'products/:id' => 'products#destroy'
  patch 'products/:id' => 'products#update'
  put 'products/:id' => 'products#update'
  get 'products/:id/edit' => 'products#edit', :as => 'edit_product'
end
