Rails.application.routes.draw do
  # just add this code for all of the below
  # makes the 7 crud routes
  root to: 'restaurants#index'
  resources :restaurants

  # lets say you want to limit what they do, so youd don't get all seven
  # resources :restaurants, only: [:index, :show]
  # resources :restaurants, except: [:destroy, :update, :new, :create, :edit] # same as above


  # # routes for restrauants crud CRUD! (see letters below)
  # # VERB 'PATH', to: 'CONTROLLER_PREFIX#ACTION'

  # # create a new restrant (C)
  # # 2 routes, one to show the form one to create the restauant
  # # show the form
  # get 'restaurants/new', to: 'restaurants#new' # form page
  # # posts to one of the paths below, if you have a different verb you can use the same location
  # post 'restaurants', to: 'restaurants#create' # creates new rest

  # # list all restrauanrts (R)
  # get 'restaurants', to: 'restaurants#index'

  # # show a speicifc restarant (R)
  # get 'restaurans/:id', to: 'restaurants#show' #note how even if url is single, method is on plural

  # # update a secific restrant (U)
  # # get 'restaurants/update', to: << not this, need to know WHICH one you will change
  # # edit is a better word than update
  # get 'restaurants/:id/edit', to: 'restaurants#edit' # form page
  # patch 'restaurants/:id', to: 'restaurants#update'

  # # delete a specific restranut (D)
  # delete 'restaurants/:id', to: 'restaurants#destroy'



end
