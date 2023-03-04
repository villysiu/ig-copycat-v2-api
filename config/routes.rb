Rails.application.routes.draw do # get 'current_user/index'
  # get '/current_user', to: 'current_user#index'
  # get '/private/test'
  # patch '/private/update'

  # match '/users',   to: 'private#index',   via: 'get'
  # match '/current_user', to: 'private#test', via: 'get'
  # match '/update_user', to: 'private#update', via: 'patch'

  match '/current_user', to: 'users/user#curr_user', via: 'get'
  match '/users', to: 'users/user#index',   via: 'get'
  match '/user', to: "users/user#update", via: 'patch'
  match 'users/:id', to: "users/user#show", via: 'get'

  match '/avatar', to: "users/avatar#update", via: 'patch'
  match '/avatar', to: "users/avatar#destroy", via: 'delete'
  match '/photos/:photo_id/likes', to: "likes#destroy", via: 'delete'

  get '/401', to: 'users#user#unauthorized', as: :unauthorized
  devise_for :users,
  path: '',
               path_names: {
                 sign_in: 'login',
                 sign_out: 'logout',
                 registration: 'signup'
               },
    
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  
  resources :photos do
    resources :likes
  end
  resources :photos do
    resources :comments
  end

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
