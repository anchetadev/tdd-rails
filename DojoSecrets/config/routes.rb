Rails.application.routes.draw do
  get 'users/new'

  get 'users/show'

  get 'users/edit'

  get 'sessions/new'

  patch  '/users/:id/edit' => 'users#update'
  resources :users
  get 'sessions/new' => 'sessions#new'
  post 'sessions/new' => 'sessions#create'
  # delete 'sessions/:id' => 'sessions#destroy'

  #    users_new GET    /users/new(.:format)      users#new
#   users_show GET    /users/show(.:format)     users#show
#   users_edit GET    /users/edit(.:format)     users#edit
# sessions_new GET    /sessions/new(.:format)   sessions#new
#        users GET    /users(.:format)          users#index
#              POST   /users(.:format)          users#create
#     new_user GET    /users/new(.:format)      users#new
#    edit_user GET    /users/:id/edit(.:format) users#edit
#         user GET    /users/:id(.:format)      users#show
#              PATCH  /users/:id(.:format)      users#update
#              PUT    /users/:id(.:format)      users#update
#              DELETE /users/:id(.:format)      users#destroy

end
