Rails.application.routes.draw do
  root to: 'dances#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :phrases
  resources :dances
  # get '/phrases', to: 'phrases#index'
  # get '/phrases/:id', to: 'phrases#show', as: 'phrase'
  # get '/moves', to: 'moves#index'
  # get '/moves/:id', to: 'moves#show', as: 'move'
  # get '/dances', to: 'dances#index'
  # get '/dances/:id', to: 'dances#show', as: 'dance'
end
  
#   get '/dances', to: 'dances#index'
  
#   get '/new' do
#         erb :new
#   end
  
#   post '/create' do
#       save_content(params["title"], params["content"])
#       redirect URI.escape("/#{params["title"]}")
#   end
 
#   get '/:title/edit' do
#       @title=params[:title]
#       @content=page_content(@title)
#       erb :erb
#   end
    
#   put '/:title' do
#       save_content(params["title"], params["content"])
#       redirect URI.escape ["/#{params["title"]}"]
#   end
  
#   delete '/:title' do
#       delete_content(params[:title])
#       redirect '/'
#   end 
  
# end