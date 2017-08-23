Rails.application.routes.draw do
  root 'application#welcome'
  resources :users, :bank_accounts, :stocks, :in_app_accounts, :investments

 get '/signin' => 'sessions#new'
 post '/signin' => 'sessions#create'
 post '/logout' => 'sessions#destroy'
 get '/in_app_accounts/:id/transfer', to: 'in_app_accounts#transfer', as: 'transfer'
 post '/in_app_accounts/:id', to: 'in_app_accounts#newtransfer'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
