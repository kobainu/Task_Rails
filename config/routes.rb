Rails.application.routes.draw do
  get 'posts/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :posts
  #                                                     Controller#Action
  # posts_index GET    /posts/index(.:format)           posts#index
  #       posts GET    /posts(.:format)                 posts#index
  #             POST   /posts(.:format)                 posts#create
  #    new_post GET    /posts/new(.:format)             posts#new
  #   edit_post GET    /posts/:id/edit(.:format)        posts#edit
  #        post GET    /posts/:id(.:format)             posts#show
  #             PATCH  /posts/:id(.:format)             posts#update
  #             PUT    /posts/:id(.:format)             posts#update
  #             DELETE /posts/:id(.:format)             posts#destroy
end
