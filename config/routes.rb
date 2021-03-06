Rails.application.routes.draw do
  root 'application#welcome'
  resources :users, :bank_accounts, :stocks, :in_app_accounts, :investments, :friendships

 get '/signin' => 'sessions#new'
 post '/signin' => 'sessions#create'
 post '/logout' => 'sessions#destroy'
 get 'users/:id/investments', to: 'users#investment', as: 'user_investment'
 get '/in_app_accounts/:id/transfer', to: 'in_app_accounts#transfer', as: 'transfer'
 patch '/in_app_accounts/:id/transfer', to: 'in_app_accounts#newtransfer'
 get 'users/:id/bankaccounts', to: 'users#bankaccount', as: 'user_bankaccounts'
 get 'users/:id/friends', to: 'users#friend', as: 'user_friends'
 get 'friendships/:id/transfer', to: 'friendships#transfer', as: 'friendship_transfer'
 patch 'friendships/:id/transfer', to: 'friendships#newtransfer'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
