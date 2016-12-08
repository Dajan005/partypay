Rails.application.routes.draw do
  # Routes for the Count resource:
  # CREATE
  get "/counts/new", :controller => "counts", :action => "new"
  post "/create_count", :controller => "counts", :action => "create"

  # READ
  get "/counts", :controller => "counts", :action => "index"
  get "/counts/:id", :controller => "counts", :action => "show"

  # UPDATE
  get "/counts/:id/edit", :controller => "counts", :action => "edit"
  post "/update_count/:id", :controller => "counts", :action => "update"

  # DELETE
  get "/delete_count/:id", :controller => "counts", :action => "destroy"
  #------------------------------

  # Routes for the Item resource:
  # CREATE
  get "/items/new", :controller => "items", :action => "new"
  post "/create_item", :controller => "items", :action => "create"
  post "/qcreate_item", :controller => "items", :action => "instantcreate"

  # READ
  get "/items", :controller => "items", :action => "index"
  get "/items/:id", :controller => "items", :action => "show"


  # UPDATE
  get "/items/:id/edit", :controller => "items", :action => "edit"
  post "/update_item/:id", :controller => "items", :action => "update"
    get "/update_item/:id", :controller => "items", :action => "update"

  # DELETE
  get "/delete_item/:id", :controller => "items", :action => "destroy"

  #------------------------------

  # Routes for the Event resource:
  # CREATE
  get "/events/new", :controller => "events", :action => "new"
  post "/create_event", :controller => "events", :action => "create"

  # READ
  get "/events", :controller => "events", :action => "index"
  get "/events/:id", :controller => "events", :action => "show"

  # UPDATE
  get "/events/:id/edit", :controller => "events", :action => "edit"
  post "/update_event/:id", :controller => "events", :action => "update"

  # DELETE
  get "/delete_event/:id", :controller => "events", :action => "destroy"
  #------------------------------

  devise_for :users


  root "events#index"

  # Routes for the User resource:
get "/users", :controller => "users", :action => "index"
get "/users/:id", :controller => "users", :action => "show"

  get "/my_events", :controller => "myevents", :action => "show"
  get "/my_charges", :controller => "mycharges", :action => "show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
