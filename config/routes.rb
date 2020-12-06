Rails.application.routes.draw do
  root "boards#index"
  
  resource :users, controller: 'registrations',only: [:create, :edit, :update] do 
     get '/sign_up', action: 'new' 
  end
# post '/users', to: 'registrations#create'
# get "/users/edit", to: "registrations#edit", as: 'edit_registration'
# put "/users/edit", to: "registrations#update", as: 'update _registration'

  resource :users, controller: 'sessions',only: [] do 
    get '/sign_in', action: 'new'
    post '/sign_in', action: 'create' 
    delete '/sign_out', action: 'destroy'
  end

  # get '/users/sign_in', to: 'sessions#new', as: 'session'
  # post '/login', to: 'sessions#create', as: 'login'
  # delete '/users/sign_out', to: 'sessions#destroy', as: 'logout'

  resources :boards do
    resources :posts, shallow: true
  end
end
