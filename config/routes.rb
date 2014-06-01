AlingnenaApp::Application.routes.draw do
  resources :debts

  get 'products/:id' => 'products#show'
end
