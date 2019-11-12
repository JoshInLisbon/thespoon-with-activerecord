rails c to test model
but this adds data to the db
rails g migration add_rating_to_restaurants rating:integer
rails console --sandbox
when you exit the sandbox everything you made is deleted
  this keeps the database clean

after you add validation to the model you don't need to migrate
you can just validate'

if you run
  rails destroy model Restaurant
  it will not remove
  has_many or belongs_to

  Rails DB tasks
  rails db:drop - Drop the database (lose all your data!)
  rails db:create - Create the database with an empty schema
  rails db:migrate - Run pending migrations on the database schema
  rails db:rollback - Revert the last migration
  rails db:reset - Drop database + create tables found in schema.rb


  rails db:rollback is very useful
  very useful if you jsut migrated
  after migrating you realise it would be good to have something added
  you can run rails db rollback
  rollback last migration
  you only revert the last migration

  good to do if you have data on your
    db then it's good to rollback
    faster too
    max 2 rollbacks?
    thne he drops...'

for rails db:seed
  you have no output
  so he adds puts
  so he can see

destroy records before the seeds


these are essential to learn:

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # routes for restrauants crud CRUD! (see letters below)
  # VERB 'PATH', to: 'CONTROLLER_PREFIX#ACTION'

  # create a new restrant (C)
  # 2 routes, one to show the form one to create the restauant
  # show the form
  get 'restaurants/new', to: 'restaurants#new' # form page
  # posts to one of the paths below, if you have a different verb you can use the same location
  post 'restaurants', to: 'restaurants#create' # creates new rest

  # list all restrauanrts (R)
  get 'restaurants', to: 'restaurants#index'

  # show a speicifc restarant (R)
  get 'restaurant/:id', to: 'restaurants#show' #note how even if url is single, method is on plural

  # update a secific restrant (U)
  # get 'restaurants/update', to: << not this, need to know WHICH one you will change
  # edit is a better word than update
  get 'restaurants/:id/edit', to: 'restaurants#edit' # form page
  patch 'restaurant/:id' to 'restaurants#update'

  # delete a specific restranut (D)
  delete 'restaurant/:id', to: 'restaurants#destroy'
end
