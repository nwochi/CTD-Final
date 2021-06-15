Rails.application.routes.draw do
  root to: 'welcome#welcome'
  # root to: 'dances#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :phrases
  
  post '/dances/add_phrase_name/:id', to: 'dances#add_phrase_name', as: 'add_phrase_name'
  get '/dances/edit_phrases/:id', to: 'dances#edit_phrases', as: 'edit_phrases'
  resources :dances
  
  # get '/moves/:id/edit(.:format)'
  # get 'moves/create(.:format)'
  resources :moves
  get '/phrases/edit_moves/:id', to: 'phrases#edit_moves', as: 'edit_moves'
  post '/phrases/add_move/:id', to: 'phrases#add_move', as: 'add_move'
  delete '/phrases/delete_move/:id', to: 'phrases#delete_move', as: 'delete_move'
  
  
  # resources :dance_to_phrases
  # put '/dances/edit_phrases/:id', to: 'dances#edit_phrases', as: 'edit_phrases'
  # edit_move '/moves', to: 'moves#edit' #new line that I am not sure about
  # create_move 'moves', to: 'moves#create' #new line that I am not sure about
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