Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  get '/citations' => 'citations#index'
  get '/citations/:id' => 'citations#show'
  post '/citations' => 'citations#create'
  patch '/citations/:id' => 'citations#update'
  delete 'citations/:id' => 'citations#destroy'

  get '/cards' => 'cards#index'
  get '/cards/:id' => 'cards#show'
  post '/cards' => 'cards#create'
  patch '/cards/:id' => 'cards#update'
  delete 'cards/:id' => 'cards#destroy'

  get '/citation_comments' => 'citation_comments#index'
  get '/citation_comments/:id' => 'citation_comments#show'
  post '/citation_comments' => 'citation_comments#create'
  patch '/citation_comments/:id' => 'citation_comments#update'
  delete 'citation_comments/:id' => 'citation_comments#destroy'

  get '/users' => 'users#index'
  get '/users/:id' => 'users#show'
  post '/users' => 'users#create'
  patch '/users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'

  get '/freeform' => 'freeform#index'
  get '/freeform/:id' => 'freeform#show'
  post '/freeform' => 'freeform#create'
  patch '/freeform/:id' => 'freeform#update'
  delete 'freeform/:id' => 'freeform#destroy'

  get '/topics' => 'topics#index'
  get '/topics/:id' => 'topics#show'
  post '/topics' => 'topics#create'
  patch '/topics/:id' => 'topics#update'
  delete 'topics/:id' => 'topics#destroy'

  get '/debates' => 'debates#index'
  get '/debates/:id' => 'debates#show'
  post '/debates' => 'debates#create'
  patch '/debates/:id' => 'debates#update'
  delete 'debates/:id' => 'debates#destroy'

  get '/speeches' => 'speeches#index'
  get '/speeches/by-debate/:debate_id' => 'speeches#find_all_debate_speeches'
  get '/speeches/:id' => 'speeches#show'
  post '/speeches' => 'speeches#create'
  post '/create-speeches' => 'speeches#commit_speech'
  patch '/speeches/:id' => 'speeches#update'
  delete 'speeches/:id' => 'speeches#destroy'

  get '/structured_arguments' => 'structured_arguments#index'
  get '/structured_arguments/:id' => 'structured_arguments#show'
  post '/structured_arguments' => 'structured_arguments#create'
  patch '/structured_arguments/:id' => 'structured_arguments#update'
  delete 'structured_arguments/:id' => 'structured_arguments#destroy'

end
