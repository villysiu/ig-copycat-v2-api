Rails.application.routes.draw do # get 'current_user/index'
  get '/current_user', to: 'current_user#index'
  get '/private/test'
  patch '/private/update'
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

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
