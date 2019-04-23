# == Route Map
#
#     Prefix Verb   URI Pattern                           Controller#Action
#       root GET    /                                     topics#index
#      users POST   /users(.:format)                      users#create
#   new_user GET    /users/new(.:format)                  users#new
# topic_post GET    /topics/:topic_id/posts/:id(.:format) posts#show
#     topics GET    /topics(.:format)                     topics#index
#            POST   /topics(.:format)                     topics#create
#  new_topic GET    /topics/new(.:format)                 topics#new
# edit_topic GET    /topics/:id/edit(.:format)            topics#edit
#      topic GET    /topics/:id(.:format)                 topics#show
#            PATCH  /topics/:id(.:format)                 topics#update
#            PUT    /topics/:id(.:format)                 topics#update
#            DELETE /topics/:id(.:format)                 topics#destroy

Rails.application.routes.draw do

	root :to => 'topics#index'
	resources :users, :only => [:new, :create]
	resources :topics  do
		resources :posts, :only => [:show]
	end

	get '/login' => 'session#new'
	post '/login' => 'session#create'
	delete '/login' => 'session#destroy'

end