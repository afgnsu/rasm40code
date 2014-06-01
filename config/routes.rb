AlingnenaApp::Application.routes.draw do
  resources :debts

  get 'products' => 'products#index' 
  get 'products/:id' => 'products#show'
  
end
